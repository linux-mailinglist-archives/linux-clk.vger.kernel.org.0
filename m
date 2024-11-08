Return-Path: <linux-clk+bounces-14441-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3449C1B63
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 11:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE52E281894
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 10:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEF91F4721;
	Fri,  8 Nov 2024 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NkNnPD0o"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD5F1F4294
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063050; cv=none; b=sqhrV0uYAHf6imQ+FFBBbTycGa3FTo2HdO4d6O8RhF00Gwgzb3bCJQ+9oXuDGMRfv0MPl6357WB6kQmVQWIAfNyGjKzfWSVYNMp6v4/fn2J4cJn7BdLyQtHN+vxRivoUGOZ0v2MPCPKNpLY8KjG1PV5gNkKzKfXjHk4MQBn7NOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063050; c=relaxed/simple;
	bh=xFFbioEROLNPyGM49qKI+pehNU+1477vY2Y70y9bICA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hspm2Y63nvC9GA87BQGHhk80WC8avy+DSJ7KjVDa6udeKxqm+HpJ/7qIQNiZIcVt7SFWlbyprDSPAc5gYPaZZo3l+nqVvbsxdVZVPKqqHUtQ5dQmKECT0Hko1viF2syuonn0UkipuID9ZdwZKS1lskxO3g2E9fUalCxoI9K8ygg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NkNnPD0o; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a99f646ff1bso284349566b.2
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063046; x=1731667846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rthMUF+vMt5MM5B9Aqdvs2YjjwpYxK5VQtE0WQ3XZxo=;
        b=NkNnPD0oJibAeFODQ/7ozde/gB9+x2ITCjOWutTnaWTdfJv/1Y6pipJjha5YmFPX6S
         mqi2t3TwM4TUgBLhlWspibsH2MxCS7ghdcRUW01ljIc0plzpHLaCu5etJ1xkwWQMMLsZ
         igsVIdA4uULr9uOiAOWj/SjRhSrqkoT+DF18Uei1v1tLW+WaLuWpPYaBCHEfgdpScHKY
         iWSQEimetVNGV0VYHZoisdkhE7kh1iwXJUFvEgrhOQi3VuHv761D7cIDz3WrxKfIWlIz
         +vNWjJNJgLhUrB+/v+aRhoxaA3X2F/BigUbRFQ/Y9zF5ScBHXHeusQZB6gPfaOUEhPy7
         FMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063046; x=1731667846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rthMUF+vMt5MM5B9Aqdvs2YjjwpYxK5VQtE0WQ3XZxo=;
        b=K6W2AAUaOR+SIv7KZlsuZdL+abprjr07zT6Mf0GPZeHg+3q2tw9mzLFlYSuRxF+1KW
         3SAqp3Ylb8GRB7ilGoSCu9RnDF9A3MdA1PrXUyLuycBODTj4VcBBwKUJE6b4gHh/Mqx0
         o+o/SK+u3nugJTLujOAj36XgJVzD6b7vuP9lKkDDFPrRvAC6WrWtXl67CUR657M9ilo5
         x4+w+/mApaiF+/JYlUmxIL73DT0IfYxisJOLVKRHqUNnU2zKiBPeUI4L70lNH+rO/MBt
         IRntrONlaQt40auWZxrKePEK53aDDkzaezAnQJ505vnhVWq1nMYzZtrznDYyZFaWGM8V
         Sy0g==
X-Forwarded-Encrypted: i=1; AJvYcCXq9CKzTCClLVK+uAtZ6CGw/Z2trTNvyMiDUAOT2xmfPJVuts0au+ESvTHpBhTY5WmI1Nz8m/IiFss=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPe7M5ewXU92M1BFnAs0qzXFgN5HRsQfyKu9/j+5v+BWisQpsT
	mH0F1JfQj/dbW3h7ucM+8bRCetrTRVbe7HbkN7aDorJSybr2gXlexNFQbt/3Hr0=
X-Google-Smtp-Source: AGHT+IGOSLqeQ+ElPtVRFNVoP4vVBtmPTa3P5gFos8Wi42uIeVIZ2ytk126yhHQS01GyrotYAEPuFA==
X-Received: by 2002:a17:907:84a:b0:a9a:1a6a:b5f5 with SMTP id a640c23a62f3a-a9ef00234c9mr192359166b.56.1731063046591;
        Fri, 08 Nov 2024 02:50:46 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:46 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 14/25] ASoC: sh: rz-ssi: Use goto label names that specify their actions
Date: Fri,  8 Nov 2024 12:49:47 +0200
Message-Id: <20241108104958.2931943-15-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use goto label names that specify their action. In this way we can have
a better understanding of what is the action associated with the label
by just reading the label name.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 2f56c63582e7..4af381f6d470 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1084,15 +1084,15 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	/* Error Interrupt */
 	ssi->irq_int = platform_get_irq_byname(pdev, "int_req");
 	if (ssi->irq_int < 0) {
-		rz_ssi_release_dma_channels(ssi);
-		return ssi->irq_int;
+		ret = ssi->irq_int;
+		goto err_release_dma_chs;
 	}
 
 	ret = devm_request_irq(dev, ssi->irq_int, &rz_ssi_interrupt,
 			       0, dev_name(dev), ssi);
 	if (ret < 0) {
-		rz_ssi_release_dma_channels(ssi);
-		return dev_err_probe(dev, ret, "irq request error (int_req)\n");
+		dev_err_probe(dev, ret, "irq request error (int_req)\n");
+		goto err_release_dma_chs;
 	}
 
 	if (!rz_ssi_is_dma_enabled(ssi)) {
@@ -1136,7 +1136,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	ssi->rstc = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(ssi->rstc)) {
 		ret = PTR_ERR(ssi->rstc);
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	reset_control_deassert(ssi->rstc);
@@ -1152,17 +1152,17 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_snd_soc;
+		goto err_pm_put;
 	}
 
 	return 0;
 
-err_snd_soc:
+err_pm_put:
 	pm_runtime_put(dev);
 err_pm:
 	pm_runtime_disable(dev);
 	reset_control_assert(ssi->rstc);
-err_reset:
+err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
 
 	return ret;
-- 
2.39.2


