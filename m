Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C82C6EA8E0
	for <lists+linux-clk@lfdr.de>; Fri, 21 Apr 2023 13:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjDULLd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 21 Apr 2023 07:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjDULLd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2023 07:11:33 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C32DA267
        for <linux-clk@vger.kernel.org>; Fri, 21 Apr 2023 04:11:32 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-63b60366047so1780385b3a.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Apr 2023 04:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682075491; x=1684667491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ4eKElwcXuAb6zZfl+qVzBQVUqclnD1hUAJWdjMu78=;
        b=l9Cq+zu1tu3PWplXH9Uj+nBZKyq3Rnk2OdYC4CsMxNwxy1eLaZNZQXRZalzD/SaNF8
         O7qI0bCblAILe+N6lNiuhXsyfK46Q6dt3FcSeKctUFp+66jAkg7b5tvMvDUUJPYAEeUX
         EWp/H37UdqKNTDzMK0c7LEh0zDkZlLmhDVjjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682075491; x=1684667491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJ4eKElwcXuAb6zZfl+qVzBQVUqclnD1hUAJWdjMu78=;
        b=IvBi/E0i0cf6ISc+DXDw5juFUz6yniXnOyceHt/e5QJR/H4p4vwEG17mRN2IkySeDx
         w1eSzWVg+kSrthMrxhhE2KecFfWeqnkdv9Iqt5Db8p5NleIF/qN6iMBwBVtC77sOj6kL
         xyCXqkBE8kcIMq50abNov05rNUdk7JYbXsIxcAlveZtD9B4vKam64H3imzGeu2X2RzAK
         tWZo1hTRfaVFkFxJ18rho8+a5F2tYIZT7tnvF2Mhnph+64j21Pv3lgK1ZfBIlI4oEhUz
         yk3Xccvmsiq9q5w8VB0wsLuOAPTBcaCt7gtHGw0QHpxMM1PiS9b8MZ8RjTDznfrt2/VM
         x93A==
X-Gm-Message-State: AAQBX9cn6FrcOgndCWqZTEl+4170gzGfMlBJdDP8iOCve9eqSuk91iub
        WG54M5evqXANpkUw663GG8RFWA==
X-Google-Smtp-Source: AKy350YjnNhyz/5DJTFMIFsnSfoBoVKhugxroxKYawrehd6/D9CSJXkJCdAySnCEcB05FVhuF+9sqg==
X-Received: by 2002:a05:6a00:15ce:b0:63d:3411:f9e3 with SMTP id o14-20020a056a0015ce00b0063d3411f9e3mr6904730pfu.19.1682075491514;
        Fri, 21 Apr 2023 04:11:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:47fa:fa8d:a971:f6ac])
        by smtp.gmail.com with ESMTPSA id x4-20020a628604000000b00639fc7124c2sm2840983pfd.148.2023.04.21.04.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 04:11:31 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: mediatek: Enable all MT8192 clocks by default
Date:   Fri, 21 Apr 2023 19:11:25 +0800
Message-ID: <20230421111125.2397368-1-wenst@chromium.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently the base MT8192 clock drivers are enabled by default, but all
the other clock drivers need to be enabled by hand. This is extremely
confusing and inconvenient for end users. For the MT8192 platform to be
useful, most if not all the clock drivers driving the hardware blocks
need to be enabled.

Enable them by default whenever MT8192 base clock driver is enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 99e67c07e638..48b42d11111c 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -781,72 +781,84 @@ config COMMON_CLK_MT8192
 config COMMON_CLK_MT8192_AUDSYS
 	tristate "Clock driver for MediaTek MT8192 audsys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 audsys clocks.
 
 config COMMON_CLK_MT8192_CAMSYS
 	tristate "Clock driver for MediaTek MT8192 camsys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 camsys and camsys_raw clocks.
 
 config COMMON_CLK_MT8192_IMGSYS
 	tristate "Clock driver for MediaTek MT8192 imgsys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 imgsys and imgsys2 clocks.
 
 config COMMON_CLK_MT8192_IMP_IIC_WRAP
 	tristate "Clock driver for MediaTek MT8192 imp_iic_wrap"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 imp_iic_wrap clocks.
 
 config COMMON_CLK_MT8192_IPESYS
 	tristate "Clock driver for MediaTek MT8192 ipesys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 ipesys clocks.
 
 config COMMON_CLK_MT8192_MDPSYS
 	tristate "Clock driver for MediaTek MT8192 mdpsys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 mdpsys clocks.
 
 config COMMON_CLK_MT8192_MFGCFG
 	tristate "Clock driver for MediaTek MT8192 mfgcfg"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 mfgcfg clocks.
 
 config COMMON_CLK_MT8192_MMSYS
 	tristate "Clock driver for MediaTek MT8192 mmsys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 mmsys clocks.
 
 config COMMON_CLK_MT8192_MSDC
 	tristate "Clock driver for MediaTek MT8192 msdc"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 msdc and msdc_top clocks.
 
 config COMMON_CLK_MT8192_SCP_ADSP
 	tristate "Clock driver for MediaTek MT8192 scp_adsp"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 scp_adsp clocks.
 
 config COMMON_CLK_MT8192_VDECSYS
 	tristate "Clock driver for MediaTek MT8192 vdecsys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 vdecsys and vdecsys_soc clocks.
 
 config COMMON_CLK_MT8192_VENCSYS
 	tristate "Clock driver for MediaTek MT8192 vencsys"
 	depends on COMMON_CLK_MT8192
+	default COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 vencsys clocks.
 
-- 
2.40.0.634.g4ca3ef3211-goog

