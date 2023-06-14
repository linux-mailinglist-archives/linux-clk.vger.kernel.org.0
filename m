Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90B1E715731
	for <lists+linux-clk@lfdr.de>; Tue, 30 May 2023 09:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbjE3HkN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 May 2023 03:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbjE3HjS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 03:39:18 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 501AB1B0
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 00:38:34 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30ad458f085so2729917f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 00:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432312; x=1688024312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzGw3mnXKJmEBxB/ZGH2LxB1IwHqbuKVGACW14o5hFY=;
        b=jaSvKiIr2GX85xMjOgkTYd/HWVGIErooo3BURQ2chRmHroR3WP6Ikhi0FAFeeT5Lys
         jXW6AwnBAoN46UdpnHDy7IEY74KLt5biienTFYOyY/jFc5y53K3tiMW4+N+FmiWR1gQc
         bF1vbW6Q1tCC5Jh5O2jT3WI9b+YCSWKPHnNH5ump3ZdyPlcB3UbWZS1B/jmouzSKKxl9
         OZHOe343iv7+FvsfFBlo/QSrumwSFfu+uBZutxNs+0fMGnXySL58ysc+bP8k8hPdDfNi
         GHmxV9RG4qXK/bbbeoTpReGiNX6B4aYVFa3nDsh4sGAQb6mIrmjUcQ9BFb6zx/DrN5gt
         dWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432312; x=1688024312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzGw3mnXKJmEBxB/ZGH2LxB1IwHqbuKVGACW14o5hFY=;
        b=Lrtw7tjoGz88MvN5Ww8NXUnphj1SGqM75pEQI4RmKRzVh7Mb/3bDevNH3eiLZT9Uku
         yOC/XoLuiW5xNPDwUgr47NV/J6SZlX+ydIQVQ3MtKquj9Aa58MWWSD/H79N/QJMppJQI
         1wzgtKLvo7tyVMKP6+s5nQb/Y5hgE1SdPkeHtTEw70nPnjjqz/L5bGfJrdvcGAm6eLlB
         BIOq6VfiBmf19Gldeo23nYhwQ3NV54h7Iopc68MHbODKRQl8BXRAydZbyDoSMtLWSX50
         fG2S/AmySr2bJy7A0TYJveQCBCfNoeix6+nW0EKl84hgTy59Vs+d3daMmGVRGpsCReZC
         ZgKA==
X-Gm-Message-State: AC+VfDyW2hFaHQDPBg67krJuEXtjXzikJnrkCt17Va8G/FWo7JNS1mS4
        TCiRti06cOb3fYrE3DXrCB0vAg==
X-Google-Smtp-Source: ACHHUZ77/qAdFM2wzyEMZZRv9RkbZMbz2osrr0BTQq8TerRslhCr1N4wB1ijOVmrPptU+vS84dzTrA==
X-Received: by 2002:adf:dd92:0:b0:30a:efcc:f89a with SMTP id x18-20020adfdd92000000b0030aefccf89amr1159782wrl.2.1685432312266;
        Tue, 30 May 2023 00:38:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:38:31 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 30 May 2023 09:38:17 +0200
Subject: [PATCH v5 16/17] dt-bindings: arm: amlogic: Document the MNT
 Reform 2 CM4 adapter with a BPI-CM4 Module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-16-56eb7a4d5b8e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fIWufPqpiAaBMP19Qwx5MHQ5YAp+jh4vCf4MBkZNrjM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafj8mU+WLsf6CBN4sbskK8u3Jc3USNNMUE0iCYF
 DXtlAPCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn4wAKCRB33NvayMhJ0UjwD/
 4lK6RBrPN1bgsAqClEb/SiEYIPhDC9AWoFJFret61RyB/QGf7FQjlZqw1uKS/OTK5I/fbVedds+mcy
 ZEzbMxwGk3yxnDpv2r24Gz4pZWCcxo5wQ5Z6v1TbN9/1JGOExKHQG6jHyEkJOAecWX9nyAT5LYhe1P
 KdVhbvB/pV/munVEeeqE88eS5eyaTjBPWEoSOxmxIUawx1SulT2bivNuByNAwC/lIvV+iPe4T5uYz4
 /XNjaH/N1/5UKT0emdVvZeJXu4ghWm7M6VCk8lywau7+sthVaFbTBV9hyQ+HWsUCXVqnXNH4+G5aE9
 XI3ZtIhT6dmX1hdZyBnwFI+7TP8ykE76+4VAjfJ+5Y+vT7cK+vdEAAZFiUq5PcCUxw/gJQ1d7z2/Im
 TDkf8F3CaumwjBVmdtJplBfDT5yQZTtoxC3UfFCANjdx8B/OHbcfVfDEF90wxuI/eSVj+TZXpQar+y
 ZylVRPz2yN/BeWRxugLbvWn34tBIYmSRhjyRg+BkMN//awVAQKqbbjnGMC4mEhSRhZld9SkKbOxWat
 fY8q6AvNyIHbHiJTExqfOZ1/hbv3LNdSPOnKGyHy0pLcN08K9sVJgfFPdMFYm89BdyYRGl6fsH/7v+
 IEJTHUoZDileY77ataCJcYv3BVPHK6vl+RiwUG8GOnroH2we/u5bAb8GNcwg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
compatible module such as a BPI-CM4 Module, document that.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 08d59842655c..c237afef5093 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -163,6 +163,7 @@ properties:
         items:
           - enum:
               - bananapi,bpi-cm4io
+              - mntre,reform2-cm4
           - const: bananapi,bpi-cm4
           - const: amlogic,a311d
           - const: amlogic,g12b

-- 
2.34.1

