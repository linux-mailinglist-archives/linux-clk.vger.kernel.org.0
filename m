Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09D744C1BA0
	for <lists+linux-clk@lfdr.de>; Wed, 23 Feb 2022 20:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244249AbiBWTOs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 23 Feb 2022 14:14:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244218AbiBWTOr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 14:14:47 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16A641302
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 11:14:06 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 14E9E40296
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 19:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645643633;
        bh=jDkZtIbGu7Rx+CZZvT8FrNfVIDpOYhUi3Zl4KFBr3UY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=nTp19xxVAbTxz3Wu3Tj/RYLu/Lc1Zjp/vUm8sJVZV1zvdvZjJGD0w18vS9w3JJ6AN
         /83gMiqb+2vt8y0qnUVk5YIwmMkJTCcem2SKgVXFhKcNiu4GOqEOB+k4WQXn/LQSzV
         66FLqutgj6eDdMLUSr8xiYsN344hly67dIOh5ZYx9TcLQLQegYCwRHXmiLwWCRFFL3
         anbYXhZM9iqf3Ie4/bsAuHeTx1DuHSe9f5CtY1gjhBs5CN5ZQYvgRj+fJfRZt4T6PB
         /QvOQsNaUPhua4wTgHc53pMc+ttqOeOt7CWdA3UjJA5cMa0tnR0RHtMH3FVGFQqPah
         rAOX+afS7vx3g==
Received: by mail-ej1-f70.google.com with SMTP id qa30-20020a170907869e00b006cee5e080easo7439115ejc.3
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 11:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jDkZtIbGu7Rx+CZZvT8FrNfVIDpOYhUi3Zl4KFBr3UY=;
        b=prh530FBXJ07rmqZAosWHJ7OJjRlPuqqPFHRQ5ZtsGoYEB9z7MHSz2GoyVFitrlxo2
         iacEO7ubH3uzcO3NWbnsoRCSbbMqYm+4+t3HE84hLXRW8EHGm/UMjjM6UgeCFsDcvXVf
         a3xvTf3/UhE4sLkzE/dx5UWoSiTSZa1O5z85r8aYnVohCjUYSGs9OivDsiaGWme5AS9A
         cJ0vhFqEOyowfTgFT3oq66tO1cCQ21SPnGAk068cx5+TomEtNmUvj0uMroYuESQn7C/X
         InBJAvl7n3Tox2CGNMdXV6NN1pVzekQ/9WlLIH2rgEUqlGD8ahiXfP8ooEKW1eKM8CAP
         QGLA==
X-Gm-Message-State: AOAM530Kx+pwJtZZP2Mii3B0+dvea9LuHi8jPrXx+gMdbSu2nXdvalGJ
        CGuS0ZLRilQniPBVFT/8nWmjDayGHlmO+8qTmriLrgWiDT2GNb5dnQHZBLsRl7aObpooqVjKypN
        r6U01twCoUBJXWLGpfv7EPfoQ+0/BfyhDvYscsA==
X-Received: by 2002:a17:906:16cc:b0:6ce:e607:ff02 with SMTP id t12-20020a17090616cc00b006cee607ff02mr872215ejd.418.1645643630085;
        Wed, 23 Feb 2022 11:13:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxRdig8NaceeNOO2F1vxV5JTwYIw54VeRpY5+G4e03MaYaAg/BDtvoqP0gdGTwXBo6IyszVA==
X-Received: by 2002:a17:906:16cc:b0:6ce:e607:ff02 with SMTP id t12-20020a17090616cc00b006cee607ff02mr872176ejd.418.1645643629849;
        Wed, 23 Feb 2022 11:13:49 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id q5sm212611ejc.115.2022.02.23.11.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 11:13:48 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
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
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v2 01/11] driver: platform: add and use helper for safer setting of driver_override
Date:   Wed, 23 Feb 2022 20:13:00 +0100
Message-Id: <20220223191310.347669-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Several core drivers and buses expect that driver_override is a
dynamically allocated memory thus later they can kfree() it.

However such assumption is not documented, there were in the past and
there are already users setting it to a string literal. This leads to
kfree() of static memory during device release (e.g. in error paths or
during unbind):

    kernel BUG at ../mm/slub.c:3960!
    Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
    ...
    (kfree) from [<c058da50>] (platform_device_release+0x88/0xb4)
    (platform_device_release) from [<c0585be0>] (device_release+0x2c/0x90)
    (device_release) from [<c0a69050>] (kobject_put+0xec/0x20c)
    (kobject_put) from [<c0f2f120>] (exynos5_clk_probe+0x154/0x18c)
    (exynos5_clk_probe) from [<c058de70>] (platform_drv_probe+0x6c/0xa4)
    (platform_drv_probe) from [<c058b7ac>] (really_probe+0x280/0x414)
    (really_probe) from [<c058baf4>] (driver_probe_device+0x78/0x1c4)
    (driver_probe_device) from [<c0589854>] (bus_for_each_drv+0x74/0xb8)
    (bus_for_each_drv) from [<c058b48c>] (__device_attach+0xd4/0x16c)
    (__device_attach) from [<c058a638>] (bus_probe_device+0x88/0x90)
    (bus_probe_device) from [<c05871fc>] (device_add+0x3dc/0x62c)
    (device_add) from [<c075ff10>] (of_platform_device_create_pdata+0x94/0xbc)
    (of_platform_device_create_pdata) from [<c07600ec>] (of_platform_bus_create+0x1a8/0x4fc)
    (of_platform_bus_create) from [<c0760150>] (of_platform_bus_create+0x20c/0x4fc)
    (of_platform_bus_create) from [<c07605f0>] (of_platform_populate+0x84/0x118)
    (of_platform_populate) from [<c0f3c964>] (of_platform_default_populate_init+0xa0/0xb8)
    (of_platform_default_populate_init) from [<c01031f8>] (do_one_initcall+0x8c/0x404)
    (do_one_initcall) from [<c0f012c0>] (kernel_init_freeable+0x3d0/0x4d8)
    (kernel_init_freeable) from [<c0a7def0>] (kernel_init+0x8/0x114)
    (kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)

Provide a helper which clearly documents the usage of driver_override.
This will allow later to reuse the helper and reduce amount of
duplicated code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/base/driver.c           | 44 +++++++++++++++++++++++++++++++++
 drivers/base/platform.c         | 24 +++---------------
 include/linux/device/driver.h   |  1 +
 include/linux/platform_device.h |  6 ++++-
 4 files changed, 54 insertions(+), 21 deletions(-)

diff --git a/drivers/base/driver.c b/drivers/base/driver.c
index 8c0d33e182fd..79efe51bb4c0 100644
--- a/drivers/base/driver.c
+++ b/drivers/base/driver.c
@@ -30,6 +30,50 @@ static struct device *next_device(struct klist_iter *i)
 	return dev;
 }
 
+/*
+ * set_driver_override() - Helper to set or clear driver override.
+ * @dev: Device to change
+ * @override: Address of string to change (e.g. &device->driver_override);
+ *            The contents will be freed and hold newly allocated override.
+ * @s: NULL terminated string, new driver name to force a match, pass empty
+ *     string to clear it
+ *
+ * Helper to setr or clear driver override in a device, intended for the cases
+ * when the driver_override field is allocated by driver/bus code.
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int driver_set_override(struct device *dev, char **override, const char *s)
+{
+	char *new, *old, *cp;
+
+	if (!dev || !override || !s)
+		return -EINVAL;
+
+	new = kstrndup(s, strlen(s), GFP_KERNEL);
+	if (!new)
+		return -ENOMEM;
+
+	cp = strchr(new, '\n');
+	if (cp)
+		*cp = '\0';
+
+	device_lock(dev);
+	old = *override;
+	if (strlen(new)) {
+		*override = new;
+	} else {
+		kfree(new);
+		*override = NULL;
+	}
+	device_unlock(dev);
+
+	kfree(old);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(driver_set_override);
+
 /**
  * driver_for_each_device - Iterator for devices bound to a driver.
  * @drv: Driver we're iterating.
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 6cb04ac48bf0..d8853b32ea10 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1275,31 +1275,15 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	char *driver_override, *old, *cp;
+	int ret;
 
 	/* We need to keep extra room for a newline */
 	if (count >= (PAGE_SIZE - 1))
 		return -EINVAL;
 
-	driver_override = kstrndup(buf, count, GFP_KERNEL);
-	if (!driver_override)
-		return -ENOMEM;
-
-	cp = strchr(driver_override, '\n');
-	if (cp)
-		*cp = '\0';
-
-	device_lock(dev);
-	old = pdev->driver_override;
-	if (strlen(driver_override)) {
-		pdev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		pdev->driver_override = NULL;
-	}
-	device_unlock(dev);
-
-	kfree(old);
+	ret = driver_set_override(dev, &pdev->driver_override, buf);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 15e7c5e15d62..81c0d9f65a40 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -151,6 +151,7 @@ extern int __must_check driver_create_file(struct device_driver *driver,
 extern void driver_remove_file(struct device_driver *driver,
 			       const struct driver_attribute *attr);
 
+int driver_set_override(struct device *dev, char **override, const char *s);
 extern int __must_check driver_for_each_device(struct device_driver *drv,
 					       struct device *start,
 					       void *data,
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 7c96f169d274..37ac14459499 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -31,7 +31,11 @@ struct platform_device {
 	struct resource	*resource;
 
 	const struct platform_device_id	*id_entry;
-	char *driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match, use
+	 * driver_set_override() to set or clear it.
+	 */
+	char *driver_override;
 
 	/* MFD cell pointer */
 	struct mfd_cell *mfd_cell;
-- 
2.32.0

