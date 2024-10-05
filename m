Return-Path: <linux-clk+bounces-12773-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8B89916DB
	for <lists+linux-clk@lfdr.de>; Sat,  5 Oct 2024 14:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B75E0282947
	for <lists+linux-clk@lfdr.de>; Sat,  5 Oct 2024 12:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EE714F10E;
	Sat,  5 Oct 2024 12:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="2AviVhhE"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B2714AD20;
	Sat,  5 Oct 2024 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728132445; cv=none; b=tNGGiMzDqC3Wbaeqh6Z6gp+vEFSBCkrlwXvgA3NX+XmBfVJs6ukkJUo/LYa83V3ZhPJ6p1DNHy2ArnyuwdvSZRj6mx7B5OIXa3q5kuyuA1mYPa6B4gNMCWpOjApuq9x6umXPb9UCN3cg9yQ4atjVDjzT/D9mQM8j5XqGNX8joEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728132445; c=relaxed/simple;
	bh=mFx+U4GcSDdopKlqlzwtHYpyI1W1kasBQAt42bd2ZM8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=sEpewdukSJXtLIdOo/VvRyM9UKDhHZYO2FWO7gBskagdeyXRzqH+pTwNCLHQX8No2Q5V8G8A7iZiEy/gvqPWdbEBZ4mezgBXz5Yv50kx72dnUDgP/EemSAWL7LroF5D0lfvn3FbCYZ3eGL3KY43pOBs/7Rgg6wVPAHoo2gKoY50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=2AviVhhE; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=tzKgvh+pT+/ApAb95UUjz/MFj8CO1vRHstRCj/wa6Eo=; b=2AviVhhEc9I43avvEvSd9FJFUO
	mvL3BzJ+JvAsGEDvIMfXqnYgDMSWzSQY1Y28KKzOdtBhzH2t7Vgg762dlXA0rfxBscYOBLGvnshln
	m9QsHiKiZV2pjb3a97ulNmNjALdEwgAJ8GmbAop52z7BrnBNdz4w6h75URUFMAYdRaknyw2HMh5JV
	vrrtlul2pm+Ko6qjF9Nm1+aG1tjUPIncogUV/YrEb28nPVTOprnB/0jCwHOrahjsI6Y5KHqmUwDq4
	NRCwyedP380M1ag50xOfXl06hqtF7H2ajH1BwxrAaL957cMDVX1HCdQ/Ix0Va/WP06fFBx6qK2Zjn
	dKkF/0Yg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Lee Jones <lee@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 0/3] mfd: twl: Add clock for TWL6030
Date: Sat,  5 Oct 2024 14:47:03 +0200
Message-Id: <20241005124706.601393-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously the clock support for only implemented for TWL6032 so add
it also for the TWL6030. There are devices out there where especially
WLAN only works if these clocks are enabled by some patched U-Boot.
This allows to explicitly specify the clock requirements.

Changes in V3:
- use type enum in driver_data and twl_clock_info
- revert back to store device instead of platform_device

Changes in V2:
- cleanup some defines
- no separate ops for 6030
- remove is_prepared()
- update Kconfig

Andreas Kemnade (3):
  mfd: twl-core: Add a clock subdevice for the TWL6030
  clk: twl: remove is_prepared
  clk: twl: add TWL6030 support

 drivers/clk/Kconfig    |  2 +-
 drivers/clk/clk-twl.c  | 69 ++++++++++++++++++++++++++----------------
 drivers/mfd/twl-core.c | 32 ++++++++++++++------
 3 files changed, 66 insertions(+), 37 deletions(-)

-- 
2.39.5


