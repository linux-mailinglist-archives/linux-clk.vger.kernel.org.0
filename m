Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B869C78CAC2
	for <lists+linux-clk@lfdr.de>; Tue, 29 Aug 2023 19:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237852AbjH2RSp (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 29 Aug 2023 13:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237792AbjH2RSN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Aug 2023 13:18:13 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23DB1CDB;
        Tue, 29 Aug 2023 10:17:47 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99bcfe28909so599817266b.3;
        Tue, 29 Aug 2023 10:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329456; x=1693934256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OQ0uMxvObgSXiZXc7XOlyouI6S5o18+qbYKi7xXiJU=;
        b=s6TtVUA4v+M9p7voV9EqzvUO+K5WnHhoucMfikXrOctuv0npQViR9s2C9ZYl8QZg3C
         ha9NhlM5TlfZrKtOKhpdHZuZsg6tAfKrWJUjSQ0TzuuO9FJQK++7NdyOLroBXGGnWFI1
         r3HCGu0t7PYsICfeek6yu93Oic3IKLo3RLzu0aEoV/jip2b+Q/gs2wdc5nvo1NIY/WTq
         5M1n6EdqA3HneC+0V4wldGuWurwlrST09o5836u/s61IX3BEGDbeZj9iMssE8vLrN8tF
         nc1i8u/7WNu8cTuShuhNVGz7xRw3j8scGML0r67kSDE2DNOGjY4nUEdUcuisLn+oEiyv
         v/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329456; x=1693934256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OQ0uMxvObgSXiZXc7XOlyouI6S5o18+qbYKi7xXiJU=;
        b=E/9a0BJLQprZeoqkERwW2shTAJFUb0Fn+0LhElD1VOxDl/eMXbmGS1XWsYTHnKMZA1
         Q+DpM81STLdJjJyded2540XNWYOmxOe7cOtUrZMWvlWdODwxCr7oJIMCDw1fQhoQ7kyA
         nZRu9z0xl2WaESIf/U5ZoXsKf9jCTFRBpPBuaBmq4BCbaZeZYHXnWAESqqaoctJrz394
         5u0NY4JFXQG6UXwcq5/UrPBTFCIrgyb66TbDchZD3CpJtF4jXhl8fMYSjmomamgahbVu
         EUkSifkoE86ATjqyNVLNlbetx9LKfd5qoKTMpye0wxG19OXmZcHZkLxqClEeVIhLYki9
         zNsg==
X-Gm-Message-State: AOJu0YzDUHHdunj11dlvJnp5xKRRGpxvnH5pH46JOjuL5mD37/jmmQl8
        161QIlju6m/a1ZmwLouUmA==
X-Google-Smtp-Source: AGHT+IH0+bHTepjEA8hR54kf7EM9Nb5uT+O5JhoqwdO0nyAn5FMjZRDBmEfIMY/Ri8mcEWEggh+wbA==
X-Received: by 2002:a17:906:76d2:b0:9a1:7919:d3d5 with SMTP id q18-20020a17090676d200b009a17919d3d5mr21742168ejn.43.1693329456174;
        Tue, 29 Aug 2023 10:17:36 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:35 -0700 (PDT)
From:   Alex Bee <knaerzche@gmail.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Elaine Zhang <zhangqing@rock-chips.com>,
        Johan Jonker <jbx6244@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
        Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 12/31] ARM: dts: rockchip: Add missing quirk for RK3128's dma engine
Date:   Tue, 29 Aug 2023 19:16:28 +0200
Message-ID: <20230829171647.187787-13-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Like most other Rockchip ARM SoCs, the PL330 needs the
arm,pl330-periph-burst quirk in order to work as expected.
Add it.

Fixes: a0201bff6259 ("ARM: dts: rockchip: add rk3128 soc dtsi")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index bf55d4575311..9125bf22e971 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -459,6 +459,7 @@ pdma: dma-controller@20078000 {
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 		arm,pl330-broken-no-flushp;
+		arm,pl330-periph-burst;
 		clocks = <&cru ACLK_DMAC>;
 		clock-names = "apb_pclk";
 		#dma-cells = <1>;
-- 
2.42.0

