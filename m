Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A431C4C5BC3
	for <lists+linux-clk@lfdr.de>; Sun, 27 Feb 2022 14:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbiB0Ny1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 27 Feb 2022 08:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbiB0Ny0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Feb 2022 08:54:26 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8888A65BD
        for <linux-clk@vger.kernel.org>; Sun, 27 Feb 2022 05:53:49 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4CB624004D
        for <linux-clk@vger.kernel.org>; Sun, 27 Feb 2022 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645970028;
        bh=npGNvoQmcQXzOf9MUvG7bOfkjnwx60Xk35PbEgCfPxw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=TuSSqqLER80YcA1/RpVOJ2K5WL+/AG4UvX1GCjPhRt8igN7+egU3VdFqP01lBdTto
         bi/nxScJF30ylROyvEEDzmBsUOUKH6InN4ULr93fj2AJr3syOgPXbfaXz7M3/N9LIW
         hCMJbtjL2yP1tFFrmDIQ6Bi4VXsbkm6FTvIw0GqWZwMiQR4GVHTXM0Ve2Am0Xm3l1g
         6opBlecxSjQoQZNWNbwBvD0FQY727Z2YQhARzYOUQVp8cpRLjYiV0QW/DN35YpzwmE
         GjrWXp3FtU8dOd1JGX00qfI4gOAsZqsOzTy9k27FjhYMmgfo+qL1uRfM4ltpZI6w58
         WrGnFMGNOFueA==
Received: by mail-wm1-f69.google.com with SMTP id q17-20020a1ca711000000b0037be98d03a1so4940405wme.0
        for <linux-clk@vger.kernel.org>; Sun, 27 Feb 2022 05:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=npGNvoQmcQXzOf9MUvG7bOfkjnwx60Xk35PbEgCfPxw=;
        b=vJ9kBigShKj99cot+xqHwHAkU/4r8nEFtFEyiBEn5yXVnnyvD1hkjo299QqdUSFEUX
         /JlgXTHVlYy2RPCbnQlMfRLxOrgot3xLQA41BJfQAx2LPr8vbfJB8rC9M5pjUroJ6dgy
         RW1hTdNttwHgOc6BRgkwoLNY/r2rhhbz+nmUNjaf6BfYLhXg6/JD/B7tYwGS093ED4JV
         4k4mYO8vYuWdEhI2HufffoqOop3WEHJawov/WWNWa1iCFoD8k7FAmw62SASSWLM9WMBd
         IotVaxIAlxWaRQRoNyHRhQ8gE3YYrSGKxyEnhFcW2Zqyc5XUDR4Dql6aVpP2C1Hy6MLv
         ADoA==
X-Gm-Message-State: AOAM530JUT8GFiVNhwPEY6YkC6AFwnERdYRY5ovMTtILQu+W4EpCJgvZ
        wz2OExp88GqeEl8tcnUtA76X0p4zqRc4M483MgV7bGXYNBrO6G0lDNSul+hBejJqoERHm/CllqC
        xhmaHh4umTrW8cQHqNZ1rUTk6H8e1GkgchIQLiQ==
X-Received: by 2002:aa7:d49a:0:b0:410:875c:e21b with SMTP id b26-20020aa7d49a000000b00410875ce21bmr15261497edr.357.1645970017415;
        Sun, 27 Feb 2022 05:53:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzicu7l4IEwzqhlq2xIFoxdFytokSeMFkgjaEtpJW9Dl/uL3ibJtEoSzuA4VDSoAwu8n3nm0A==
X-Received: by 2002:aa7:d49a:0:b0:410:875c:e21b with SMTP id b26-20020aa7d49a000000b00410875ce21bmr15261460edr.357.1645970017251;
        Sun, 27 Feb 2022 05:53:37 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id w11-20020a056402128b00b00412ec3f5f74sm4600760edv.62.2022.02.27.05.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 05:53:36 -0800 (PST)
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
Subject: [PATCH v3 08/11] vdpa: Use helper for safer setting of driver_override
Date:   Sun, 27 Feb 2022 14:53:26 +0100
Message-Id: <20220227135329.145862-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
References: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use a helper for seting driver_override to reduce amount of duplicated
code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/vdpa/vdpa.c  | 29 ++++-------------------------
 include/linux/vdpa.h |  4 +++-
 2 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 9846c9de4bfa..2d924a89ce28 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -77,32 +77,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct vdpa_device *vdev = dev_to_vdpa(dev);
-	const char *driver_override, *old;
-	char *cp;
+	int ret;
 
-	/* We need to keep extra room for a newline */
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
-	device_lock(dev);
-	old = vdev->driver_override;
-	if (strlen(driver_override)) {
-		vdev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		vdev->driver_override = NULL;
-	}
-	device_unlock(dev);
-
-	kfree(old);
+	ret = driver_set_override(dev, &vdev->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index 2de442ececae..89ec4e4d4cdc 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -64,7 +64,9 @@ struct vdpa_mgmt_dev;
  * struct vdpa_device - representation of a vDPA device
  * @dev: underlying device
  * @dma_dev: the actual device that is performing DMA
- * @driver_override: driver name to force a match
+ * @driver_override: driver name to force a match; do not set directly,
+ *                   because core frees it; use driver_set_override() to
+ *                   set or clear it.
  * @config: the configuration ops for this device.
  * @cf_mutex: Protects get and set access to configuration layout.
  * @index: device index
-- 
2.32.0

