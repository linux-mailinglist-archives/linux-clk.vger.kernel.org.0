Return-Path: <linux-clk+bounces-16020-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 109B09F757F
	for <lists+linux-clk@lfdr.de>; Thu, 19 Dec 2024 08:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47128170108
	for <lists+linux-clk@lfdr.de>; Thu, 19 Dec 2024 07:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888F82185BB;
	Thu, 19 Dec 2024 07:27:58 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F152185A0
	for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 07:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734593278; cv=none; b=U1l/S1ZSRyjg+9KEc/D2RprSN6bzcBGeVtCW8Yqc85ritm/k1pNs04Bv+2VY/45ur020708mqmDI/XA0MPgVDLkJXyCc3p/dSMs2xWWPvXNIlpMJxGl8RKnmR0uX1JXebAdxCJQnVuKrmJ+80NoP7pR9SpixlwD6WNXDVVNdXuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734593278; c=relaxed/simple;
	bh=ygYZ1AvOcZirdO25wvQ4ZgKHzwKg4fkFfV2JKSJqFw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t9FYrGmnbxho8LnhTBmE05A7P5ltCo1qY1D+0EAwB5dHADLWyqrGN1ks0NszHQsp94E66yCDeAnk0Dqr0dQnE/gNyN0zgO0ux48iazOGq4A16IOF7C4MwQkZwC4UEX6sjQ/sT07eyJ0x85U3Vo1/tElzyb41VXWhorCtfqUdiow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwX-00072C-N2; Thu, 19 Dec 2024 08:27:33 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwW-004AP8-1O;
	Thu, 19 Dec 2024 08:27:33 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwX-00Gewn-0L;
	Thu, 19 Dec 2024 08:27:33 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Thu, 19 Dec 2024 08:27:34 +0100
Subject: [PATCH 3/6] arm64: dts: imx8mp: add fsl,nominal-mode property into
 nominal.dtsi
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-imx8m-clk-v1-3-cfaffa087da6@pengutronix.de>
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
In-Reply-To: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>, 
 Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.13-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

The imx8mp-nominal.dtsi is meant to be included into boards that want to
override the default overdrive clock settings with settings suitable for
running in nominal drive mode at its lower required voltage.

Specifying fsl,nominal-mode informs drivers of this fact, so they can
sanity check runtime clock reconfiguration to observe the limits imposed
by nominal mode.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
index f9a82a663033..532eb049c7e8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
@@ -21,6 +21,7 @@ &clk {
 			       <800000000>,
 			       <600000000>,
 			       <400000000>;
+	fsl,nominal-mode;
 };
 
 &pgc_hdmimix {

-- 
2.39.5


