Return-Path: <linux-clk+bounces-312-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B46017F0C30
	for <lists+linux-clk@lfdr.de>; Mon, 20 Nov 2023 08:01:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E47A11C204F6
	for <lists+linux-clk@lfdr.de>; Mon, 20 Nov 2023 07:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508DF63C6;
	Mon, 20 Nov 2023 07:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QTf9lhew"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E968ED51
	for <linux-clk@vger.kernel.org>; Sun, 19 Nov 2023 23:01:12 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507e85ebf50so5145918e87.1
        for <linux-clk@vger.kernel.org>; Sun, 19 Nov 2023 23:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700463671; x=1701068471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2en4yv4YpXFN3VCi3B3SISp0lZy/QFymnnSLRtY+3pY=;
        b=QTf9lhewJfbzft3XCWSxCFS1TXo0hw638GArgBf5I6Ts0Jc7CBcZlhMPEVQBugIwA4
         SqtYXkjyRQ6bbObhwze5jmBhGRtyD9p0MnzcFwazTKLKD2it6H/PWDXuhdEvpMlBQ4C0
         nui32BEWxaDLa2B6G7eIQAnSZjKwNqWUsxQ+a4J5qWMjQ07gHbOArTTQxX/sEYeF1j5J
         SWaJ00pfZyJv+K7wf78KMmmOF9gJPWUKXayfK1OvpfUhuiN56ohx6EIRvrCl/amDlmF+
         vqXPrbi5n79cDGn5P47VnIgtWNaQjm+sw7xEpL78nPBONkZFal8NQVpvVPamhPVaowYR
         8NVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700463671; x=1701068471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2en4yv4YpXFN3VCi3B3SISp0lZy/QFymnnSLRtY+3pY=;
        b=w7vSKdzMUiePHGU4cDqcSMEZ7pbIrHR4S8r5arehiKw0n46/J6EnkArmN1mmxYfz6i
         TYUZsOlqz4AuTrvo00H414Gkq1q+CyAXHNrLcalj8iwS0qAlGKjYrmdaUB5u5UZZC09d
         1y+6LMTVCtD8CHDiAFQfps9VNnWsMDP0Cro11tfh+1v6zrdaemOVHI23xdumFovRSAXn
         s3l+tIK0eSHfxPr+vYMBZ6G9VuK7d+Rar6uTYZahnJmo32sdeG+/+nPJ+2sE4ArgAbrd
         hGYM0/cqnTZT6SND57YlLbkQg8sZRwsBeSA1xpERfCsQTKbRNiove/yh4zClb5n/ci2q
         bAVQ==
X-Gm-Message-State: AOJu0YxIDB4Lp9iX2cXqGvBWT6xJRT4Mw6WojknVHlcUTrCVelIax7QX
	zyf6jRZmtB+AAsDjBsW80hF66A==
X-Google-Smtp-Source: AGHT+IGwg2J8+I0uPjj9+o2L6Muf2cF2j1P+TgbE6Op0BXx+lqxUHN1EuXRuAKc54dfHijcSYIEOVw==
X-Received: by 2002:ac2:599b:0:b0:503:2deb:bbc1 with SMTP id w27-20020ac2599b000000b005032debbbc1mr4294366lfn.22.1700463670849;
        Sun, 19 Nov 2023 23:01:10 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm8777667wrq.78.2023.11.19.23.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:01:10 -0800 (PST)
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
	linux@armlinux.org.uk,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	p.zabel@pengutronix.de,
	arnd@arndb.de,
	m.szyprowski@samsung.com,
	alexandre.torgue@foss.st.com,
	afd@ti.com,
	broonie@kernel.org,
	alexander.stein@ew.tq-group.com,
	eugen.hristev@collabora.com,
	sergei.shtylyov@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 05/14] pinctrl: renesas: rzg2l: Move arg in the main function block
Date: Mon, 20 Nov 2023 09:00:15 +0200
Message-Id: <20231120070024.4079344-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Move arg in the main block of the function as this is used by 3 out of 4
case blocks of switch-case. In this way some lines of code are removed.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 9de350ad7e7d..21ee628363fa 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -842,7 +842,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 	struct rzg2l_pinctrl_pin_settings settings = pctrl->settings[_pin];
 	unsigned int *pin_data = pin->drv_data;
 	enum pin_config_param param;
-	unsigned int i;
+	unsigned int i, arg;
 	u32 cfg, off;
 	int ret;
 	u8 bit;
@@ -865,8 +865,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 		param = pinconf_to_config_param(_configs[i]);
 		switch (param) {
 		case PIN_CONFIG_INPUT_ENABLE: {
-			unsigned int arg =
-					pinconf_to_config_argument(_configs[i]);
+			arg = pinconf_to_config_argument(_configs[i]);
 
 			if (!(cfg & PIN_CFG_IEN))
 				return -EINVAL;
@@ -880,9 +879,10 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			break;
 
 		case PIN_CONFIG_DRIVE_STRENGTH: {
-			unsigned int arg = pinconf_to_config_argument(_configs[i]);
 			unsigned int index;
 
+			arg = pinconf_to_config_argument(_configs[i]);
+
 			if (!(cfg & PIN_CFG_IOLH_A) || hwcfg->drive_strength_ua)
 				return -EINVAL;
 
@@ -907,9 +907,10 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			break;
 
 		case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS: {
-			unsigned int arg = pinconf_to_config_argument(_configs[i]);
 			unsigned int index;
 
+			arg = pinconf_to_config_argument(_configs[i]);
+
 			if (!(cfg & PIN_CFG_IOLH_B) || !hwcfg->iolh_groupb_oi[0])
 				return -EINVAL;
 
-- 
2.39.2


