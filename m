Return-Path: <linux-clk+bounces-11718-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE9296B2AE
	for <lists+linux-clk@lfdr.de>; Wed,  4 Sep 2024 09:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0A6D1C210B0
	for <lists+linux-clk@lfdr.de>; Wed,  4 Sep 2024 07:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0EFE12CDAE;
	Wed,  4 Sep 2024 07:20:19 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-sh.amlogic.com (unknown [58.32.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04D56BFA3;
	Wed,  4 Sep 2024 07:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.32.228.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725434419; cv=none; b=qnPFB/QBNkv+8dVP77yud/AuBOp7ShNbpzIQIo3nChrBdovZpep/i/NzMn3W/TkzV4EmD2/b4XS7SlSNH5hOnrLgLXQ/+1kG0I2GVYMLSaHBkmpcybB4Q21yVhzTprOC5CPMWkjVESiUw7stTlBKr6UkE4s4cKAMjyT91hDKSB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725434419; c=relaxed/simple;
	bh=2iTGxmMVH5VUA5RDc42DEOgj73k0zWC3IueoJohCP0Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GImQrwtvfl2JYsgHlX8q7+6bb6zxDMmvAtqjnFYtd7MrS0WL7saCPsMYZhlSGrYlIN7CMIUlYwmR9rl77TDQkeE+M2tbG19pP3m2hr6fC+CyxT011i9ii2HCoJnNwuhC9N05QKf837Iu+rVH7YZkQYK7V2wCgbqhnz1Z/ybcBGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=58.32.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from droid02-cd.amlogic.com (10.98.11.201) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Wed, 4 Sep 2024
 15:20:14 +0800
From: <chuan.liu@amlogic.com>
To: <chuan.liu@amlogic.com>, <xianwei.zhao@amlogic.com>
CC: <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/5] clk: meson: Fix an issue with inaccurate hifi_pll frequency
Date: Wed, 4 Sep 2024 15:20:13 +0800
Message-ID: <20240904072013.517905-1-chuan.liu@amlogic.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Chuan Liu <chuan.liu@amlogic.com>

Some PLLs with fractional multipliers have fractional denominators that
are fixed to "100000" instead of the previous "(1 << pll->frac.width)".

The hifi_pll for both C3 and S4 supports a fractional multiplier and has
a fixed fractional denominator of "100000".

Here are the results of the C3-based command tests (already defined
CLOCK_ALLOW_WRITE_DEBUGFS):
# echo 491520000 > /sys/kernel/debug/clk/hifi_pll/clk_rate
# cat /sys/kernel/debug/clk/hifi_pll/clk_rate
491520000
# echo 1 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
# cat /sys/kernel/debug/meson-clk-msr/clks/hifi_pll_clk
491515625       +/-15625Hz
# devmem 0xfe008100 32
0xD00304A3
# devmem 0xfe008104 32
0x00014820

Based on the register information read above, it can be obtained:
m = 0xA3 = 0d163;
n = 0x1 = 0d1
frac = 0x14820 = 0d84000
od = 0x3 = 0d3

hifi_pll calculates the output frequency:
calc_rate = xtal_rate / n * (m + (frac / frac_max)) >> od;
calc_rate = 24000000 / 1 * (163 + (84000 / 100000)) >> 3;
calc_rate = 491520000

clk_rate, msr_rate, and calc_rate all match.

The test and calculation results of S4 are consistent with those of C3,
which will not be repeated here.

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:  <linux-amlogic@lists.infradead.org>
Cc:  <linux-clk@vger.kernel.org>
Cc:  <linux-arm-kernel@lists.infradead.org>
Cc:  <linux-kernel@vger.kernel.org>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>


--- b4-submit-tracking ---
# This section is used internally by b4 prep for tracking purposes.
{
  "series": {
    "revision": 1,
    "change-id": "20240904-fix_clk-668f7a1a2b16",
    "prefixes": []
  }
}
-- 
2.42.0


