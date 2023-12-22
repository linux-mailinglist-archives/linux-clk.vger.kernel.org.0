Return-Path: <linux-clk+bounces-1860-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A069F81C744
	for <lists+linux-clk@lfdr.de>; Fri, 22 Dec 2023 10:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC2161C221D1
	for <lists+linux-clk@lfdr.de>; Fri, 22 Dec 2023 09:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B998DD53E;
	Fri, 22 Dec 2023 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="TtPklQtk"
X-Original-To: linux-clk@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FC3101CF;
	Fri, 22 Dec 2023 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1703236995; x=1703841795; i=markus.elfring@web.de;
	bh=3ig45DHXiib9kb5XvzHMPJQLjNR+DPC4+AqNcZPSRqU=;
	h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
	 In-Reply-To;
	b=TtPklQtkl8+oC25Zf6mbd5TyMgo+6lOKU0OQ6BPWEXukGcGhAXOsA2ujSMIG/Gap
	 0FjgjScqL6XlK4aTVnaZ3HJHxRZL1aQsjq823KBj8V91BGqSR1LjzMCqrL6/2et+8
	 8C8s+MlA3/d5BFFoRC67FqXKoQNXhHKlEk/d2kAn+xFrqfFkzBo/8AR3PF3FlETlJ
	 woXXx67SuJbhvZELQHW62xpEIZLkBVJ3+qx6QwKbhB1PqifE/yC6Kq4i7xceVXgG0
	 X8LxdwPsXOIqB60V6Zl8O6AKnnj6wJnHsgviuBOYQ/yTm8XoPX25SZflNmBJ3S3NK
	 mnVgOzkuBZcCKFkc0w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYu1C-1rlM3f2aSe-00VDQ7; Fri, 22
 Dec 2023 10:23:15 +0100
Message-ID: <0e906ec6-fe73-4dbd-b555-a2c03b6e1030@web.de>
Date: Fri, 22 Dec 2023 10:23:13 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kuan-Wei Chiu <visitorckw@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, kernel@pengutronix.de, linux-imx@nxp.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
References: <20231210171907.3410922-1-visitorckw@gmail.com>
Subject: [PATCH] clk: imx: scu: Use common error handling code in
 __imx_clk_gpr_scu()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20231210171907.3410922-1-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bbmJkcNnDotFtiTs26dlJsi1vk2huEHcKia+9MBq1a39yWTPgMS
 jxhFdyB5D51I7V2INVG9+gNjPJfG3zdMnWzRIcEGYjtCXTTONE0KJFmWATS5l+g4+RrFe6t
 DKdM+bHpWvYpqx44h6Wp9m6v153RG55/R0H/TVxNvJ+j2z+15+3ZnVwS2zp+LQsm4Cnl4xp
 h2vs1+itu0+fUskgWwFQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zIfadAQeSq0=;U6exYvAg99UQJpr3sFbuqp6wy5Y
 CzjzhyjdOylHww44g9D/ghe4CCwUAJ8X4Qrp+cOuxiGcvCMon3Z3NT+OchSlMoBNgl7S1w/bT
 w21jCQqNaSib2HSsOVCmrtMqmCV5XSbdKUPpc/vDoO8/liVbmrC5RK5r9oiygrPVhQ/4Smu4R
 2E4/sTzLKZxxdgi2Q3OhKc/Qjq8RNnBc+xkfFTL/ELmNXQYe4cl9sPBXnfrgNun6VdZ7DFCFD
 sgrnOPBDY6x5LuumfxDBv79iIebR/OEjqIsNWc32xt+xBRQft4QxPT1kK/XjsJXqQo9q5V15s
 mMeEcee8BfcruREOc8JOQUi1OFu/YJMbgNL9Qn/g4Q948GnL+PPUO45LhWbBMiefoO59AwTuz
 +OUd5WRPfKpQobxz2X8VA8r+7vSkHZEx8eoIBRhJEazt/q7Y2rsW1MSKOimfOhCSBvxLSpyPq
 69Iga/Ok0uZ0hwf6+bsJksn1VT1CJvgp7s9lbbvEhSkqnmUpZBiZ0wegh7EAxE9vVB5/eGKnb
 zcqunlyunsIgHCMgIpTw3Q04GCzTSnUQUTC6UZpv6G7ob8ABWv/j04NCRfc/+hGrianQEe8rn
 ON5sYyyGZi6BYrg7rodUEw0FNKKfxSIp2W5ZZxWNALPzbc8G4uyjT55x4kiuImWAJ/TJls++r
 ghulBoXWNBFC3X+kKOW8/Zb0OV+CUnjLFsewyKU07UqjXSQ6OwsQ7nZQvRFdPUAzFQ04HFbsW
 8reCagSpVVsaHYOLOsNLL+L1uiQIDjDfKnceKE+cFZy0n18xSkgyEzBIEUw/AHSEROeECcAVZ
 9wBStI85eq529BwxCNeu6ljkQCebwd1cQLB669/DS8SvWZRj5GNVkqvETh68RuCEojcD78eJx
 LzVzBSh3bdLaVbgU2BU8zp2Z/aqsi14cTVHCSmqbZ/XfQ4uEmOpdDsuFTaBcu8sNYCd5q5Zo8
 NfNhaQ==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 22 Dec 2023 10:05:32 +0100

Use another label so that a bit of exception handling can be better reused
at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/clk/imx/clk-scu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index e48a904c0013..4ca9dccf3d3b 100644
=2D-- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -882,19 +882,19 @@ struct clk_hw *__imx_clk_gpr_scu(const char *name, c=
onst char * const *parent_na
 		return ERR_PTR(-ENOMEM);

 	if (!imx_scu_clk_is_valid(rsrc_id)) {
-		kfree(clk_node);
-		return ERR_PTR(-EINVAL);
+		ret =3D -EINVAL;
+		goto free_clk_node;
 	}

 	if (!imx_clk_is_resource_owned(rsrc_id)) {
-		kfree(clk_node);
-		return NULL;
+		ret =3D 0;
+		goto free_clk_node;
 	}

 	clk =3D kzalloc(sizeof(*clk), GFP_KERNEL);
 	if (!clk) {
-		kfree(clk_node);
-		return ERR_PTR(-ENOMEM);
+		ret =3D -ENOMEM;
+		goto free_clk_node;
 	}

 	clk->rsrc_id =3D rsrc_id;
@@ -922,6 +922,7 @@ struct clk_hw *__imx_clk_gpr_scu(const char *name, con=
st char * const *parent_na
 	ret =3D clk_hw_register(NULL, hw);
 	if (ret) {
 		kfree(clk);
+free_clk_node:
 		kfree(clk_node);
 		hw =3D ERR_PTR(ret);
 	} else {
=2D-
2.43.0


