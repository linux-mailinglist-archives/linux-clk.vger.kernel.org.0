Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5F35B7B5
	for <lists+linux-clk@lfdr.de>; Mon,  1 Jul 2019 11:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbfGAJON (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 1 Jul 2019 05:14:13 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36060 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbfGAJNQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Jul 2019 05:13:16 -0400
Received: by mail-wm1-f68.google.com with SMTP id u8so15011229wmm.1
        for <linux-clk@vger.kernel.org>; Mon, 01 Jul 2019 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0YLGRK88mV5vZE4LqM30CD7m71X58sUA87fhljEjqxY=;
        b=X3BPQb1oIV2x3Nt6jna67Clm8NfVyqvfwFA5grXCGNefyz+/yhFp29J7UxF350H1uB
         2A/KSsEjBPVrHmtNTaeVwZfi+LVJYzfdusQbg1SMyERh2CMHUewA7njbMAKXXbEWXqnw
         YIaqY4q70csEqv/5ucwnlOpRGHKzNggjQFQX+Ji4MMkG4ldiTmX1OrmmWnIQBZh5z6uT
         B+9B133Dk9rtO6vSMAUSlpAOf/XFsJ3J6I1Y4ikwsbti/NHvU/FmVHpxXmSEQATSrXd7
         9SiMeOTc34vpOtnfAoYiIJUANQXu3JyxsRXxVI3DG0fs4fqdic/CDqMSb3RxGpbKj8EQ
         gElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0YLGRK88mV5vZE4LqM30CD7m71X58sUA87fhljEjqxY=;
        b=n/NJtmtCGU14u56ScsFIQaAiPJbrc7+ckG8zl1yRs2VhHhXiMTd6Ggid3txOS5FUUE
         IVfi/rkVHsw8gCsrErBSUiVTJWmuRwW5vD2Gte76TmBhG5ueFbyksvOOmnwyjbgNqw9z
         eJcOX8At6x47zImAzRQ75RMtRaUm28y/0BsrPtWfU0GDeG428dfB62ZT0UhtSD3zd84/
         Zl/XtJMp3r3zKmdcFhqzoQs0h6X6/AyflEmRk74XocqlGV4mkrmIUFls8rNbyuzK8C48
         YVriiNFc7UnPcK619guJj5jbh06AlSAH6CQUF3qrAXFryc4CGrii5iQ+J+QLaVEIGzaX
         wMTg==
X-Gm-Message-State: APjAAAWc0GlQkJBu15CW9WbSX6t83vPqapcNQ2OXDbh43k60LwbZOGnX
        rPh4lpOWiG2iK+e2VdnK3X03UA==
X-Google-Smtp-Source: APXvYqxo5Z8WiwiSIqfSVLsBg4/Fz465U9hGUrecgfM0bpcIhpYoQ8Z0JjUAK9SoDzeRMVjsViWAzA==
X-Received: by 2002:a05:600c:254b:: with SMTP id e11mr15128659wma.171.1561972394998;
        Mon, 01 Jul 2019 02:13:14 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Jul 2019 02:13:14 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v3 04/14] clk: meson: eeclk: add setup callback
Date:   Mon,  1 Jul 2019 11:12:48 +0200
Message-Id: <20190701091258.3870-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a setup() callback in the eeclk structure, to call an optional
call() function at end of eeclk probe to setup clocks.

It's used for the G12A clock controller to setup the CPU clock notifiers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/meson-eeclk.c | 6 ++++++
 drivers/clk/meson/meson-eeclk.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
index 6ba2094be257..81fd2abcd173 100644
--- a/drivers/clk/meson/meson-eeclk.c
+++ b/drivers/clk/meson/meson-eeclk.c
@@ -61,6 +61,12 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (data->setup) {
+		ret = data->setup(pdev);
+		if (ret)
+			return ret;
+	}
+
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 					   data->hw_onecell_data);
 }
diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
index 9ab5d6fa7ccb..7fdf424f71a6 100644
--- a/drivers/clk/meson/meson-eeclk.h
+++ b/drivers/clk/meson/meson-eeclk.h
@@ -20,6 +20,7 @@ struct meson_eeclkc_data {
 	const struct reg_sequence	*init_regs;
 	unsigned int			init_count;
 	struct clk_hw_onecell_data	*hw_onecell_data;
+	int				(*setup)(struct platform_device *pdev);
 };
 
 int meson_eeclkc_probe(struct platform_device *pdev);
-- 
2.21.0

