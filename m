Return-Path: <linux-clk+bounces-1003-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2C5808171
	for <lists+linux-clk@lfdr.de>; Thu,  7 Dec 2023 08:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FABEB21286
	for <lists+linux-clk@lfdr.de>; Thu,  7 Dec 2023 07:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C417F19440;
	Thu,  7 Dec 2023 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FsxYiEDT"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D49D73
	for <linux-clk@vger.kernel.org>; Wed,  6 Dec 2023 23:08:09 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54c1cd8d239so754127a12.0
        for <linux-clk@vger.kernel.org>; Wed, 06 Dec 2023 23:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701932888; x=1702537688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L2MKDDBIQov2Zbz57jsnfMzDwLUlPOmC1XrJOzWC5w=;
        b=FsxYiEDToYDbaPsDAszQ2l+eNf3fkULaSRQJZ/Aj5eR2h4oIju4bZq0qbKvo84ukdk
         2flOsF98J+eGnArcnzjH4kTK1aGUpJcw9wuAm73f9GzwrVy/tuaAlZ4H+KIaXRT4d0MT
         lBIqFh/Z8/nJKowyPbU78/rTUGf7uuh+3PRzWh+TiCQiId7sCJBws4QmOICWrPFLdPqK
         8odDf/8G/X/vK+uYK+B7cXaHsowaqWHCnpyIN7+i72ZwDNp1ESKapYpbrtzAcwNI4lWl
         UDCfojYhPCQ9Znpz3ngk3xHzXRO1TrIedEydiWu169/k+sdtcq0jndaPUJbkRHwXn8CJ
         xLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701932888; x=1702537688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6L2MKDDBIQov2Zbz57jsnfMzDwLUlPOmC1XrJOzWC5w=;
        b=velcgXTyasjIArZa7jRP1Xhigv29PhgwY+F2aKQGW8LzPSDK8lVyf6iQEmBEq3PzPQ
         kazxRBROZi5kyva1dCOXjRKsUlYdaMF8+ka6h9dc2vhtdQnziOAhQopakGIqajYaAooe
         NGmZa8KE8GQOwo7TEtNYiZbZqdFlmhP0cXkY/ld2SnFP5VgiA6DdCRf1LmSd8I3rMZt1
         P+vX/+86z3PND7Mh7lW5DYhY8ZViJeIXgyu2jI7UmZnTTZrxVyykOUcshzPwaQKLeVQb
         zyJX2XHWpGcqtUchqkgkEYA0Tdv/dvloS320n8Rr0S1h3yMiA/Q87Hy8VBIx9M55MXqK
         wo4g==
X-Gm-Message-State: AOJu0YwnOkZUeFdWrooTZ19U36s0Gt4nRtxlOH7Z7Ife4PqDPrUnraiV
	1QWWl7sWH4z3wU+iUxsRvSr7zQ==
X-Google-Smtp-Source: AGHT+IEpOYNSsPBkxBY2gYtS4z9vyT/TVzZKHCBSQsPPtqxXKC8h3mfq/CU6AVQLB4w2gAIxGWF+nQ==
X-Received: by 2002:a50:8a9a:0:b0:54c:4fec:f4 with SMTP id j26-20020a508a9a000000b0054c4fec00f4mr630844edj.131.1701932887774;
        Wed, 06 Dec 2023 23:08:07 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id b41-20020a509f2c000000b0054cb88a353dsm420818edf.14.2023.12.06.23.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:08:07 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 03/11] pinctrl: renesas: rzg2l: Move arg and index in the main function block
Date: Thu,  7 Dec 2023 09:06:52 +0200
Message-Id: <20231207070700.4156557-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Move arg and index in the main block of the function as they are used by
more than one case block of switch-case (3 out of 4 for arg, 2 out of 4
for index). In this way some lines of code are removed.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- adapted for index variable and updated patch title and description
  accordingly

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index f01aa51b00c4..2eb240b731d5 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -842,7 +842,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 	struct rzg2l_pinctrl_pin_settings settings = pctrl->settings[_pin];
 	unsigned int *pin_data = pin->drv_data;
 	enum pin_config_param param;
-	unsigned int i;
+	unsigned int i, arg, index;
 	u32 cfg, off;
 	int ret;
 	u8 bit;
@@ -864,24 +864,21 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(_configs[i]);
 		switch (param) {
-		case PIN_CONFIG_INPUT_ENABLE: {
-			unsigned int arg =
-					pinconf_to_config_argument(_configs[i]);
+		case PIN_CONFIG_INPUT_ENABLE:
+			arg = pinconf_to_config_argument(_configs[i]);
 
 			if (!(cfg & PIN_CFG_IEN))
 				return -EINVAL;
 
 			rzg2l_rmw_pin_config(pctrl, IEN(off), bit, IEN_MASK, !!arg);
 			break;
-		}
 
 		case PIN_CONFIG_POWER_SOURCE:
 			settings.power_source = pinconf_to_config_argument(_configs[i]);
 			break;
 
-		case PIN_CONFIG_DRIVE_STRENGTH: {
-			unsigned int arg = pinconf_to_config_argument(_configs[i]);
-			unsigned int index;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			arg = pinconf_to_config_argument(_configs[i]);
 
 			if (!(cfg & PIN_CFG_IOLH_A) || hwcfg->drive_strength_ua)
 				return -EINVAL;
@@ -896,7 +893,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 
 			rzg2l_rmw_pin_config(pctrl, IOLH(off), bit, IOLH_MASK, index);
 			break;
-		}
 
 		case PIN_CONFIG_DRIVE_STRENGTH_UA:
 			if (!(cfg & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C)) ||
@@ -906,9 +902,8 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			settings.drive_strength_ua = pinconf_to_config_argument(_configs[i]);
 			break;
 
-		case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS: {
-			unsigned int arg = pinconf_to_config_argument(_configs[i]);
-			unsigned int index;
+		case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS:
+			arg = pinconf_to_config_argument(_configs[i]);
 
 			if (!(cfg & PIN_CFG_IOLH_B) || !hwcfg->iolh_groupb_oi[0])
 				return -EINVAL;
@@ -922,7 +917,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 
 			rzg2l_rmw_pin_config(pctrl, IOLH(off), bit, IOLH_MASK, index);
 			break;
-		}
 
 		default:
 			return -EOPNOTSUPP;
-- 
2.39.2


