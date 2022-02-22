Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD5304BF945
	for <lists+linux-clk@lfdr.de>; Tue, 22 Feb 2022 14:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbiBVN3M (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 22 Feb 2022 08:29:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232427AbiBVN3K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 08:29:10 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F4195A12
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 05:28:45 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0F2AE407BE
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645536524;
        bh=6XeuQoqUzMUksn+ZuaBzNCPcuTk2LLoHTJkT0DsbDHY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=l+jSuB5kQ1lmyW8rQz/DZ+VWC8Igl1AmWR1AMEFpj+kkXQh/BWl7WEUvUIug41P8c
         4iokWU//2k/s9MKrbVJWqyuc1GO7u0N7h9kJVI4+hF6Mcn+4ejsrLbxu4RPE3Pd22O
         +0Zi4aVNZzH1i7gfyViiXiSi5o0anowWH9xwWw/TL9M49aYH8WAu8N6NnEHDVHAn+c
         1CFraz2N6vPJIz55V12MqPgsghOvdwA7Fe2XctHy5Oliz8ab0wR8atBP4X5tpYeFlX
         TcfTYJPYL6affSA2qOoTAVCeDniCm56t1pVREpQCc1WJcFi8ie/bh98SpFbMljpGN+
         rqcSNZQtqI/Kg==
Received: by mail-ej1-f70.google.com with SMTP id qa30-20020a170907869e00b006cee5e080easo5732046ejc.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 05:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6XeuQoqUzMUksn+ZuaBzNCPcuTk2LLoHTJkT0DsbDHY=;
        b=RhIIwV6IFx4aqdesPRZfJVbauB9xD8Lke8CczSnS0AJ0gqcPz1TPySJrvtS8Aqxs2Z
         /zUHJ7L/UIK34N4hx7Ad6y/2F74K6PY3uI/MybBsvPEA/a9uIcxuiO7qCdPf7c0MnBQ3
         YoljDnlPRfzM8xoGWAKbwzEOrXcLbZh2MwxkqY+JX8+4M4U1Epnvutpk6wN9L8XyMeCC
         S/9nxDF3HhJq/W6Bek5TkPteWMc8ZYgk33hl77zX5VX4MVHTmJqVH79VV2Cua0llV6LW
         FecqZNTq1/YOJA0WuhJBNReeI3FYIyYtGQ/IuSDObpx1YOxf8Q8KuUyPf55q+TjKAZrX
         gs8w==
X-Gm-Message-State: AOAM532cto0Lj7kxZLKXobQOJjvIiOsEVQgJzq4VrupIw6jHfsIffRK5
        jDpAIczGiNAQvYNvAOMlhO+mak5iia4gSaTpBhV7HjKLpEyAEQBPKUN1I7uHSM87o9DZi639+dy
        tOEbbc3ddsPw0+vaKcEc1osvxtanf3Z43CNVQ2w==
X-Received: by 2002:a17:906:1656:b0:6cf:571c:f91d with SMTP id n22-20020a170906165600b006cf571cf91dmr19602339ejd.377.1645536523432;
        Tue, 22 Feb 2022 05:28:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymWh8nTis0+whBJdlEUIaYxkLfPNPRZyT/AbiwgON8MIxb/gad15tlt22GRXjxl9FycTeAJw==
X-Received: by 2002:a17:906:1656:b0:6cf:571c:f91d with SMTP id n22-20020a170906165600b006cf571cf91dmr19602313ejd.377.1645536523213;
        Tue, 22 Feb 2022 05:28:43 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id c5sm10029875edk.43.2022.02.22.05.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 05:28:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        stable@vger.kernel.org
Subject: [RFT PATCH 2/3] slimbus: qcom-ngd: fix kfree() of const memory on setting driver_override
Date:   Tue, 22 Feb 2022 14:27:06 +0100
Message-Id: <20220222132707.266883-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver_override field from platform driver should not be initialized
from const memory because the core later kfree() it, for example when
driver_override is set via sysfs.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 7040293c2ee8..5987d8f8a8fd 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1455,7 +1455,14 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 		}
 		ngd->id = id;
 		ngd->pdev->dev.parent = parent;
-		ngd->pdev->driver_override = QCOM_SLIM_NGD_DRV_NAME;
+		ngd->pdev->driver_override = kstrdup(QCOM_SLIM_NGD_DRV_NAME,
+						     GFP_KERNEL);
+		if (!ngd->pdev->driver_override) {
+			platform_device_put(ngd->pdev);
+			kfree(ngd);
+			of_node_put(node);
+			return -ENOMEM;
+		}
 		ngd->pdev->dev.of_node = node;
 		ctrl->ngd = ngd;
 
-- 
2.32.0

