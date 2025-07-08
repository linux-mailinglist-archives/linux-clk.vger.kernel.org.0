Return-Path: <linux-clk+bounces-24327-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2D2AFCD69
	for <lists+linux-clk@lfdr.de>; Tue,  8 Jul 2025 16:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9458A1BC790B
	for <lists+linux-clk@lfdr.de>; Tue,  8 Jul 2025 14:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C494C2E03F1;
	Tue,  8 Jul 2025 14:22:24 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CC82DAFD8;
	Tue,  8 Jul 2025 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751984544; cv=none; b=ZVhYoI6N5qqUhSfbgTXMBPvQTkPapQmJr8Yv+y22iYoGJV/3uoU7mtzFjJFPK+1DaBa0JbWdig/1JRAMF5uPJvHGdFWqCqox/EqeopSSoaan/+WJnLAgwCMQKhaknNGKV4d3z4IFgQ+5sos6ctbqrGzKGTzA6XTs99C3oAmdxEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751984544; c=relaxed/simple;
	bh=aYV11MEcb7GflSp3VMmGl1ZdpHTzcEkEZNG0Yj98xnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aVhX0Ed73zou6M0+JPXiBmX7Wu4QpqVJ1E6QSYSvBIs2uQ3An48f5N702SYFtEMuw3Lg0jiEkvocc517KsTj2eWUge0uMi0LoDZtH/FJNaRhL/wJV5/XN/GbZpsiYLN4FA9VGUdQE6CCODA4qPeq9Mp8qq8U83z943QJtt5GHgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1397F340F90;
	Tue, 08 Jul 2025 14:22:15 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v12 0/6] reset: spacemit: add K1 reset support
Date: Tue,  8 Jul 2025 22:22:05 +0800
Message-ID: <175159801109.1876819.10159207553931838865.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702113709.291748-1-elder@riscstar.com>
References: <20250702113709.291748-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Jul 2025 06:37:02 -0500, Alex Elder wrote:
> This series adds reset controller support for the SpacemiT K1 SoC.
> A SpacemiT reset controller is implemented as an auxiliary device
> associated with a clock controller (CCU).  A new header file
> holds definitions used by both the clock and reset drivers.
> 
> The only change in this version is that three of the the four resets
> associated with each PCIe port have been renamed, to align better
> with their corresponding clocks.  This affects patches 1 and 5.
> For example, for PCIe port 0:
> 
> [...]

Applied, thanks!

[6/6] riscv: dts: spacemit: add reset support for the K1 SoC
      https://github.com/spacemit-com/linux/commit/2c0cf4fed0f440200833ddfc24ea02de2cdc217c

Best regards,
-- 
Yixun Lan


