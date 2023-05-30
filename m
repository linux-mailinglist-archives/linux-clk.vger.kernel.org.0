Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E00C715714
	for <lists+linux-clk@lfdr.de>; Tue, 30 May 2023 09:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbjE3HjD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 May 2023 03:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbjE3Hic (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 03:38:32 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E64A11A
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 00:38:24 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-309382efe13so2582548f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 00:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432303; x=1688024303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iahTtbvqWeLBpjX1+R6MOcvn8qRZV/bBO4iQlxKXPRc=;
        b=qKIJNodFI1eDSMKvOuX+HN31BbwkJxrLHUnP+3O5xRrglxzicL47QtkmEZyZPTZ+ED
         xQ1T5DZbGNH5okD7A4EFrbGC8/vImRvcHlTUNzio/XYVnBEajm9idnuEKUPFQliKXaxl
         DfmuD1Y59t/Snu0y7i6OGE6oZU9yeDJNBnp1g5HXnCNYjJ8ovgIbx8p+hib7niIK/eoX
         2tE3z0UinH99WlDiFzmR917ZB2bai/NQvIgPxUj7r+A+e9GFwsrJesHiCWGuBi/vCu5M
         K83y7juuBVpBYBxF6ZJIjaueFylPdy7kuB1dbJT2CHRIHMPlpd7B7chZEHxYbYcPvOM0
         MEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432303; x=1688024303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iahTtbvqWeLBpjX1+R6MOcvn8qRZV/bBO4iQlxKXPRc=;
        b=kzf/D1mfIO9DhJQT4ej5/ZNlrC+oAj6js4ojJO3M0Dh9j8d6GLJWZyD29gYchjW3tZ
         WDCiDO++ZzONpTQ+MFCxs6V18AEbrf+X5yBQEB7aHemI2pU9oxSxbMw0nYN2vUDVnb7H
         HPGbvUl0ROwRl+32zq3XMHcDg6xPGvbyONluz/JNz5qXmIGAnqVZ1jFUSibRSjLBxAOh
         evovCmZ6OquKI9M5LpgwAKntSCNedUssrrWF8VhVb6xQ+Ov5MkRBHAAN22pgrJkGwfCY
         WEDwOv7zPHk8RzROAPT++FdYgWEEzVU2juVszcGLOijMQirBwTrwcevp/ZRe3wotx1Ql
         1nyg==
X-Gm-Message-State: AC+VfDyK0gXy9zCLxn5cNKoSjDLbQYbBfwW6/JxzpslfBcAVPgwM/fNm
        DOebhK9p/DQapeVVL0QxgK5bbQ==
X-Google-Smtp-Source: ACHHUZ7hEv+SRU+om5OwekpJritdJ/v9ZXDhPMZ+N2a+X/vXmaRr91zRHO9sgLtMSUvFH4uBhSUDtA==
X-Received: by 2002:adf:e8c5:0:b0:30a:f2a5:83dd with SMTP id k5-20020adfe8c5000000b0030af2a583ddmr853668wrn.7.1685432302819;
        Tue, 30 May 2023 00:38:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:38:22 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 30 May 2023 09:38:09 +0200
Subject: [PATCH v5 08/17] drm/meson: fix unbind path if HDMI fails to bind
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-8-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     "Lukas F. Hartmann" <lukas@mntre.com>,
        Nicolas Belin <nbelin@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8CpWFO/23ohWXtlw9VlUvRSsoZjkvEPG4DEcAI5MYHo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafgS67it5Xd/IPSiDYVRkKBdEU3k4dSZcRJg6IY
 IKzsY56JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn4AAKCRB33NvayMhJ0VUhEA
 DBaG9ujzD1I8t4CF/PcaEnEZkX3oRDTeUQ2mqXuf8uqKMsWiwUq4ejxXcT3M9558+/alirvGZSMGJR
 je5yXs+uY81A+lDAN/Kfki1r5nLbnqchdCedEoVmGvFwsnzV/kgppLF9dnxOflfOb2BS3BccuktlSL
 I6v0HTTCGbUJaDDms7NEHyl55fK0+CB7BCXNf68MpylOUs548WCOy8fl2QcPeR05x1BRjOIDHQT66Q
 XY0Kh1vJYWOe7xhxE1oCFrJqYdv0s+w9WIIF5QjNd54oUF1/jCVL26uYwy6QniOrq+quZU4vav2B8A
 9x3xioYs6uEAbKQo8WCDtg/7xMRg+6436OB/XKOSITB/1bCelI1aAYCOhaJ2uf4uGhESocQtsgfS+y
 1Sz6eUxltr2DVz6vtzP5PIjalX4CvEzPEbBZdRdnLWpoxVCbI5PJIUtLDNSTEwxsNMm2I4jM5VcjmD
 gdhMqkdV2yk/e7tSqEafcitTrOsrcQoFgbWgwDLYvTTUCIsmpat11MkLYGrODn/SjzfM0m2yYz9dc4
 PyUwkUPBoyGcjqdSadGHYXLggtZQ/8WOTu9EUQPxzU3Tv8nQdfdkbWp4JsglxXP+A2HOxZYYFzib8i
 Kp0vzZvGcm36bLWM3Btf2WRSkwVaM/nsMwg2nO/4Uq5h5NhDaL067x7/sKOQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If the case the HDMI controller fails to bind, we try to unbind
all components before calling drm_dev_put() which makes drm_bridge_detach()
crash because unbinding the HDMI controller frees the bridge memory.

The solution is the unbind all components at the end like in the remove
path.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/meson_drv.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index ca6d1e59e5d9..e060279dc80a 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -316,32 +316,34 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		goto exit_afbcd;
 
 	if (has_components) {
-		ret = component_bind_all(drm->dev, drm);
+		ret = component_bind_all(dev, drm);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't bind all components\n");
+			/* Do not try to unbind */
+			has_components = false;
 			goto exit_afbcd;
 		}
 	}
 
 	ret = meson_encoder_hdmi_init(priv);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	ret = meson_plane_create(priv);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	ret = meson_overlay_create(priv);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	ret = meson_crtc_create(priv);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	drm_mode_config_reset(drm);
 
@@ -359,15 +361,18 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 uninstall_irq:
 	free_irq(priv->vsync_irq, drm);
-unbind_all:
-	if (has_components)
-		component_unbind_all(drm->dev, drm);
 exit_afbcd:
 	if (priv->afbcd.ops)
 		priv->afbcd.ops->exit(priv);
 free_drm:
 	drm_dev_put(drm);
 
+	meson_encoder_hdmi_remove(priv);
+	meson_encoder_cvbs_remove(priv);
+
+	if (has_components)
+		component_unbind_all(dev, drm);
+
 	return ret;
 }
 

-- 
2.34.1

