Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 783664C5B85
	for <lists+linux-clk@lfdr.de>; Sun, 27 Feb 2022 14:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbiB0Nxf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 27 Feb 2022 08:53:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbiB0Nx3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Feb 2022 08:53:29 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5388713F2B
        for <linux-clk@vger.kernel.org>; Sun, 27 Feb 2022 05:52:52 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5BBB7402D7
        for <linux-clk@vger.kernel.org>; Sun, 27 Feb 2022 13:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645969970;
        bh=ovOgd1VJlKyRzMY+TlP34IMSMGHGw8uakjQlL885+iI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=fN2t5/EE2yhwXd0uArW+F/K+cHueu8APZJPBMtBVxrSBENxOvTULI4qFYk82aWCCO
         RwF9mhHhUtr7RoOqNoXxdDAOzRpNF3+zgIYyHBVEsZuJ4tqDRbdb15GjJV2Jx2USRZ
         fr7V489qhuLTKsO+/Z3M5XWyXDqDNVqpd7yyPIlWm2N2rT4busKiowhLeo3fkF1Xdl
         15gDTK6fxcKMkVY+8BdJsqeIDYRsIaIimLpuV8qWBgCG46oY2Jqy0vhDys/p7oTbVj
         wMETxWlEsvzi7+DUhi8ZHuQbd7aa7+pDDaf1HZzygG0DuUOy/mrrvRex/RKXo6IqH+
         psweF0VmAgKCg==
Received: by mail-wm1-f69.google.com with SMTP id l31-20020a05600c1d1f00b00380e3425ba7so4539290wms.9
        for <linux-clk@vger.kernel.org>; Sun, 27 Feb 2022 05:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ovOgd1VJlKyRzMY+TlP34IMSMGHGw8uakjQlL885+iI=;
        b=f3Z7nw5JdBKwsHfWQ2jb7RFPAcjU7brBStVro0KPPaAZ+zv1OFLLe7fCzY6wfHnrBy
         KOjLw8K2dlZvQnekd05uLn8ZrahOCOixNbbY14POJab8bCUfWuMH6eHED0bF6S7H8hwq
         iKceJNz2tBK/w1AM5/+i51W9/IVnvRKrZaya2KxP3FdNfjj6qJxlTFzBYY3QrKWV/gvI
         snA8aZII7FoHa9xsYy5XVs0D1VijDMKTL5NuHys4aobTGon8mFfQp3zvu4zb/YhkhEgC
         o2WZqdt6tEXsdUdeOUYkpey8rT4jH6OrX/3z9PmYXsRM9tbyJ7hjdcA+YpI31qV2GVYo
         HMMg==
X-Gm-Message-State: AOAM531tLcmpHTZXshUGfHFSODSLz5iWcKbg+iXBGzo3MDK7xDq2VXcZ
        x2Jnz7jC+B4v76XrgF0Kf9RoCbM3zzxXO7nBSyfWn+Qevvhl3MfyTdDcQBJ+467CvRc0BL9hL1x
        zQNbbbmrhm4KLnuJF9jyDimrTZ1OcVD0ZkGdXoQ==
X-Received: by 2002:a17:906:82cf:b0:6d0:3d6:8f27 with SMTP id a15-20020a17090682cf00b006d003d68f27mr11873368ejy.236.1645969959551;
        Sun, 27 Feb 2022 05:52:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaPeLTnbLCXr36eOWjnDy8E4LI71/jJS3zMt9CSPHhfhuyTLYqyLKvSg58uZ5j7Z3tq7CVSw==
X-Received: by 2002:a17:906:82cf:b0:6d0:3d6:8f27 with SMTP id a15-20020a17090682cf00b006d003d68f27mr11873353ejy.236.1645969959366;
        Sun, 27 Feb 2022 05:52:39 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm3393333ejd.133.2022.02.27.05.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 05:52:38 -0800 (PST)
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
Subject: [PATCH v3 05/11] PCI: Use driver_set_override() instead of open-coding
Date:   Sun, 27 Feb 2022 14:52:08 +0100
Message-Id: <20220227135214.145599-6-krzysztof.kozlowski@canonical.com>
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
code. Make the driver_override field const char, because it is not
modified by the core and it matches other subsystems.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/pci/pci-sysfs.c | 28 ++++------------------------
 include/linux/pci.h     |  7 ++++++-
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 602f0fb0b007..5c42965c32c2 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -567,31 +567,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	char *driver_override, *old, *cp;
-
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
-	old = pdev->driver_override;
-	if (strlen(driver_override)) {
-		pdev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		pdev->driver_override = NULL;
-	}
-	device_unlock(dev);
+	int ret;
 
-	kfree(old);
+	ret = driver_set_override(dev, &pdev->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 8253a5413d7c..5c00a8aebdf9 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -516,7 +516,12 @@ struct pci_dev {
 	u16		acs_cap;	/* ACS Capability offset */
 	phys_addr_t	rom;		/* Physical address if not from BAR */
 	size_t		romlen;		/* Length if not from BAR */
-	char		*driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.
+	 * Do not set directly, because core frees it.
+	 * Use driver_set_override() to set or clear it.
+	 */
+	const char	*driver_override;
 
 	unsigned long	priv_flags;	/* Private flags for the PCI driver */
 
-- 
2.32.0

