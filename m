Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5916A4F0BDB
	for <lists+linux-clk@lfdr.de>; Sun,  3 Apr 2022 20:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359818AbiDCSkQ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 3 Apr 2022 14:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359806AbiDCSkO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 3 Apr 2022 14:40:14 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F9139825
        for <linux-clk@vger.kernel.org>; Sun,  3 Apr 2022 11:38:19 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id v64-20020a1cac43000000b0038cfd1b3a6dso6450251wme.5
        for <linux-clk@vger.kernel.org>; Sun, 03 Apr 2022 11:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nKruD0hbBUx+nn+GE9l7RUaXsMouYslDmZcMsioEI1Q=;
        b=tS6lfS5YKhthifQEn7DXFwvlPV+7oDoF/M39bvyQgFcs/MoyTNnJb9dx6njIpfGGBK
         CGTMM/aa90fSTqbbupl0Kkd5txRKO+dNu1oYNwQpCIEYwMEEoytpf6Fo2yITgpHlDHzb
         /ZAkXqr5By6C54cUf0uhkgLQcsehyFIUkqD99d5hzscHS8jEcpKwy20kUiNnYq+6Prs9
         9duAwSyle358ryQI6eWFMjN3flbgO1idl6XqcP/EffkwOPFr6ihiq8sIl9WA50aLSdop
         pnr1IXNI5mJ1hlMOtVC+0SZKXErVMibKmYMxbLecjg8gDiyCh09pt4y7KPFDMZIEse8N
         i4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nKruD0hbBUx+nn+GE9l7RUaXsMouYslDmZcMsioEI1Q=;
        b=E7eGrU2cP9dsAQDUZyDn7zIyUkKvsF+2r+GnxG4AQtrzJ4Mipxt6yY67mhEwnsoZgC
         qcZ8ZgWmD2sTxcJ7LihxHXEdF+w5OcK44LfUTFmzznyrLlSCBF/PNbfWZkIrIcOIOIcx
         1LbAYNBGa58ouOL3wqgznZKp/e9QwA6rfWk7LvwOOGrDs+Bky0OAQqqi9tNBjYP7kgPT
         irKB1QV4awx8liHicJzlX1Tp6sxl0/o1rPGC4Uf7GTJWYaQPXzC5iVgkqRVHEko8htS7
         IHN+8E4xksV417s2hsCREoB7uuw/o0Iqdn0XmFuP9RhdNjg/OJ1P+buKzZ6Kx9q+bQ5X
         on9g==
X-Gm-Message-State: AOAM530+y6KOu5yT7Bz1wsPBJH8taZQEWfvK6fqJSbhD8rtvRJuwh71H
        LitqJQlbwU1LqzttqJLzR9ricA==
X-Google-Smtp-Source: ABdhPJxoyKUpMhVGLN21dL7NOysUyDEc+IgIdwPtQz9qdiG1G2tF9cygag4LbRBU12x6OuMTMQYxWg==
X-Received: by 2002:a05:600c:49a9:b0:38e:714d:5f49 with SMTP id h41-20020a05600c49a900b0038e714d5f49mr1115266wmp.201.1649011097633;
        Sun, 03 Apr 2022 11:38:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id l28-20020a05600c1d1c00b0038e72a95ec4sm593851wms.13.2022.04.03.11.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 11:38:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Stuart Yoder <stuyoder@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 03/12] fsl-mc: Use driver_set_override() instead of open-coding
Date:   Sun,  3 Apr 2022 20:37:49 +0200
Message-Id: <20220403183758.192236-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220403183758.192236-1-krzysztof.kozlowski@linaro.org>
References: <20220403183758.192236-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use a helper to set driver_override to reduce the amount of duplicated
code.  Make the driver_override field const char, because it is not
modified by the core and it matches other subsystems.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 25 ++++---------------------
 include/linux/fsl/mc.h          |  6 ++++--
 2 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 8fd4a356a86e..ba01c7f4de92 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -166,31 +166,14 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
-	char *driver_override, *old = mc_dev->driver_override;
-	char *cp;
+	int ret;
 
 	if (WARN_ON(dev->bus != &fsl_mc_bus_type))
 		return -EINVAL;
 
-	if (count >= (PAGE_SIZE - 1))
-		return -EINVAL;
-
-	driver_override = kstrndup(buf, count, GFP_KERNEL);
-	if (!driver_override)
-		return -ENOMEM;
-
-	cp = strchr(driver_override, '\n');
-	if (cp)
-		*cp = '\0';
-
-	if (strlen(driver_override)) {
-		mc_dev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		mc_dev->driver_override = NULL;
-	}
-
-	kfree(old);
+	ret = driver_set_override(dev, &mc_dev->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index 7b6c42bfb660..7a87ab9eba99 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -170,7 +170,9 @@ struct fsl_mc_obj_desc {
  * @regions: pointer to array of MMIO region entries
  * @irqs: pointer to array of pointers to interrupts allocated to this device
  * @resource: generic resource associated with this MC object device, if any.
- * @driver_override: driver name to force a match
+ * @driver_override: driver name to force a match; do not set directly,
+ *                   because core frees it; use driver_set_override() to
+ *                   set or clear it.
  *
  * Generic device object for MC object devices that are "attached" to a
  * MC bus.
@@ -204,7 +206,7 @@ struct fsl_mc_device {
 	struct fsl_mc_device_irq **irqs;
 	struct fsl_mc_resource *resource;
 	struct device_link *consumer_link;
-	char   *driver_override;
+	const char *driver_override;
 };
 
 #define to_fsl_mc_device(_dev) \
-- 
2.32.0

