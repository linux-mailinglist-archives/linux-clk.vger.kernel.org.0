Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A06969F19B
	for <lists+linux-clk@lfdr.de>; Wed, 22 Feb 2023 10:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbjBVJ2e (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 22 Feb 2023 04:28:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbjBVJ1y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 04:27:54 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603CC39281;
        Wed, 22 Feb 2023 01:26:48 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id BD2ED66021B8;
        Wed, 22 Feb 2023 09:26:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1677058006;
        bh=MxvuWH/dTO+XkMt4SHXb44vjcR3xjcBTmK45avejDIA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U2wqhpeLlaorMQnYQY5YXTOo7/9/N6PW+e+7ARgpgqxOyvtf42fORnZ9mPG/4Wguo
         45I4FECLJo5gtjNOwugd6LD3YQFtFknYV3FVwSzgDfTwNrIv1ZVn/GggRgXR310/Qj
         H6wSlHd/9wI5UJUsACMNdaq1xtwO6bl85nWLroDwJffAjmRBxn0gimEwYkCEM0p4eQ
         ZKbmfiQtSmjQSazrsrz2Zv6+gYa/DKOLjOncIbRBknex8B1q2NUJ6NqvOwZazmiam9
         4yjCGLt/My01rUPXwlbq2H6f7yGR63MgVTT4S2OSu5ythbyCMloPoJXLIRm6XXrBLY
         KXOOU/8Tw7O/Q==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, wenst@chromium.org,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v5 39/54] clk: mediatek: Split MT8195 clock drivers and allow module build
Date:   Wed, 22 Feb 2023 10:25:28 +0100
Message-Id: <20230222092543.19187-40-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MT8195 clock drivers were encapsulated in one single (and big) Kconfig
option: there's no reason to do that, as it is totally unnecessary to
build in all or none of them.

Split them out: keep boot-critical clocks as bool and allow choosing
non critical clocks as tristate.

As a note, the dependencies of VDEC/VENCSYS and CAM/IMG/IPE/WPESYS
are not for build-time but rather for runtime, as clocks registered
by those have runtime dependencies on either or both VPP and IMGSYS.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig  | 100 ++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/Makefile |  20 ++++---
 2 files changed, 113 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 45b7aea7648d..ab47b9ec64af 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -692,6 +692,106 @@ config COMMON_CLK_MT8195
         help
           This driver supports MediaTek MT8195 clocks.
 
+config COMMON_CLK_MT8195_APUSYS
+	tristate "Clock driver for MediaTek MT8195 apusys"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 AI Processor Unit System clocks.
+
+config COMMON_CLK_MT8195_AUDSYS
+	tristate "Clock driver for MediaTek MT8195 audsys"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 audsys clocks.
+
+config COMMON_CLK_MT8195_IMP_IIC_WRAP
+	tristate "Clock driver for MediaTek MT8195 imp_iic_wrap"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 I2C/I3C clocks.
+
+config COMMON_CLK_MT8195_MFGCFG
+	tristate "Clock driver for MediaTek MT8195 mfgcfg"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 mfgcfg clocks.
+
+config COMMON_CLK_MT8195_MSDC
+	tristate "Clock driver for MediaTek MT8195 msdc"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 MMC and SD Controller's
+	  msdc and msdc_top clocks.
+
+config COMMON_CLK_MT8195_SCP_ADSP
+	tristate "Clock driver for MediaTek MT8195 scp_adsp"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 System Companion Processor
+	  Audio DSP clocks.
+
+config COMMON_CLK_MT8195_VDOSYS
+	tristate "Clock driver for MediaTek MT8195 vdosys"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 vdosys0/1 (multimedia) clocks.
+
+config COMMON_CLK_MT8195_VPPSYS
+	tristate "Clock driver for MediaTek MT8195 vppsys"
+	depends on COMMON_CLK_MT8195
+	default COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 vppsys0/1 clocks.
+
+config COMMON_CLK_MT8195_CAMSYS
+	tristate "Clock driver for MediaTek MT8195 camsys"
+	depends on COMMON_CLK_MT8195_VPPSYS
+	default COMMON_CLK_MT8195_VPPSYS
+	help
+	  This driver supports MediaTek MT8195 camsys and camsys_raw clocks.
+
+config COMMON_CLK_MT8195_IMGSYS
+	tristate "Clock driver for MediaTek MT8195 imgsys"
+	depends on COMMON_CLK_MT8195_VPPSYS
+	default COMMON_CLK_MT8195_VPPSYS
+	help
+	  This driver supports MediaTek MT8195 imgsys and imgsys2 clocks.
+
+config COMMON_CLK_MT8195_IPESYS
+	tristate "Clock driver for MediaTek MT8195 ipesys"
+	depends on COMMON_CLK_MT8195_IMGSYS
+	default COMMON_CLK_MT8195_IMGSYS
+	help
+	  This driver supports MediaTek MT8195 ipesys clocks.
+
+config COMMON_CLK_MT8195_WPESYS
+	tristate "Clock driver for MediaTek MT8195 wpesys"
+	depends on COMMON_CLK_MT8195_IMGSYS
+	default COMMON_CLK_MT8195_IMGSYS
+	help
+	  This driver supports MediaTek MT8195 Warp Engine clocks.
+
+config COMMON_CLK_MT8195_VDECSYS
+	tristate "Clock driver for MediaTek MT8195 vdecsys"
+	depends on COMMON_CLK_MT8195_VPPSYS
+	default COMMON_CLK_MT8195_VPPSYS
+	help
+	  This driver supports MediaTek MT8195 vdecsys and vdecsys_soc clocks.
+
+config COMMON_CLK_MT8195_VENCSYS
+	tristate "Clock driver for MediaTek MT8195 vencsys"
+	depends on COMMON_CLK_MT8195_VPPSYS
+	default COMMON_CLK_MT8195_VPPSYS
+	help
+	  This driver supports MediaTek MT8195 vencsys clocks.
+
 config COMMON_CLK_MT8365
 	tristate "Clock driver for MediaTek MT8365"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 3133ad8c2028..63351957f862 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -106,13 +106,19 @@ obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
 obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o \
-				   clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o \
-				   clk-mt8195-cam.o clk-mt8195-ccu.o clk-mt8195-img.o \
-				   clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o \
-				   clk-mt8195-vdec.o clk-mt8195-vdo0.o clk-mt8195-vdo1.o \
-				   clk-mt8195-venc.o clk-mt8195-vpp0.o clk-mt8195-vpp1.o \
-				   clk-mt8195-wpe.o clk-mt8195-imp_iic_wrap.o \
-				   clk-mt8195-apusys_pll.o
+				   clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o
+obj-$(CONFIG_COMMON_CLK_MT8195_APUSYS) += clk-mt8195-apusys_pll.o
+obj-$(CONFIG_COMMON_CLK_MT8195_CAMSYS) += clk-mt8195-cam.o clk-mt8195-ccu.o
+obj-$(CONFIG_COMMON_CLK_MT8195_IMGSYS) += clk-mt8195-img.o
+obj-$(CONFIG_COMMON_CLK_MT8195_IMP_IIC_WRAP) += clk-mt8195-imp_iic_wrap.o
+obj-$(CONFIG_COMMON_CLK_MT8195_IPESYS) += clk-mt8195-ipe.o
+obj-$(CONFIG_COMMON_CLK_MT8195_MFGCFG) += clk-mt8195-mfg.o
+obj-$(CONFIG_COMMON_CLK_MT8195_SCP_ADSP) += clk-mt8195-scp_adsp.o
+obj-$(CONFIG_COMMON_CLK_MT8195_VDECSYS) += clk-mt8195-vdec.o
+obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS) += clk-mt8195-vdo0.o clk-mt8195-vdo1.o
+obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) += clk-mt8195-venc.o
+obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) += clk-mt8195-vpp0.o clk-mt8195-vpp1.o
+obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) += clk-mt8195-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365.o clk-mt8365-apmixedsys.o
 obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
 obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
-- 
2.39.2

