Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B60715CBDF
	for <lists+linux-clk@lfdr.de>; Thu, 13 Feb 2020 21:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbgBMUUF (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 13 Feb 2020 15:20:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:33786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728682AbgBMUUE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Feb 2020 15:20:04 -0500
Received: from ziggy.cz (unknown [37.223.145.31])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66F0F2469D;
        Thu, 13 Feb 2020 20:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581625203;
        bh=R8UpRNiytRsuHIWc0OqScPoYY0fGZraRBsSlvTcx6mU=;
        h=From:To:Cc:Subject:Date:From;
        b=UTS8/b23WmULbwyasgTnsQ521FQFg2A0LsOgiLNdjiDYAsDc7jh7Yd7mg5vPjGcj+
         MDg0ZmHb2J2TnmJZCAvJzhEtfSeGD/kAD33NvwqjNvYOqaj9/8rt0/W8sBdGmGaF8U
         EXN5E1fIqbHCIYSBlFcI7pEFGDwd3TQNeZBGg6IM=
From:   matthias.bgg@kernel.org
To:     robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Cc:     devicetree@vger.kernel.org, drinkcat@chromium.org,
        frank-w@public-files.de, sean.wang@mediatek.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        wens@csie.org, linux-mediatek@lists.infradead.org,
        rdunlap@infradead.org, matthias.bgg@kernel.org,
        hsinyi@chromium.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Matthias Brugger <mbrugger@suse.com>,
        Allison Randal <allison@lohutok.net>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Richard Fontana <rfontana@redhat.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        mtk01761 <wendell.lin@mediatek.com>
Subject: [PATCH v7 00/13] arm/arm64: mediatek: Fix mmsys device probing
Date:   Thu, 13 Feb 2020 21:19:40 +0100
Message-Id: <20200213201953.15268-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Matthias Brugger <mbrugger@suse.com>

This is version seven of the series. The biggest change is, that I added
a first patch that actually moves the mmsys binding from arm/mediatek to
display/mediatek, as in effect the mmsys is part of the display
subsystem.

Since version five, the clock probing is implemented through a platform driver.
The corresponding platform device get's created in the DRM driver. I converted
all the clock drivers to platform drivers and tested the approach on the Acer
Chromebook R13 (mt8173 based).
Apart from that I reordered the patches so that the DT bindings update are the
first patches.

MMSYS in Mediatek SoCs has some registers to control clock gates (which is
used in the clk driver) and some registers to set the routing and enable
the differnet blocks of the display subsystem.

Up to now both drivers, clock and drm are probed with the same device tree
compatible. But only the first driver get probed, which in effect breaks
graphics on mt8173 and mt2701.

This patch uses a platform device registration in the DRM driver, which
will trigger the probe of the corresponding clock driver. It was tested on the
Acer R13 Chromebook.

Changes in v7:
- move the binding description
- add hint to the mmsys binding document
- make mmsys description generic
- fix typo in commit message
- fix check of return value of of_clk_get
- free clk_data->clks as well
- get rid of private data structure

Changes in v6:
- re-arrange the patch order
- generate platform_device for mmsys clock driver inside the DRM driver
- fix DTS binding accordingly
- switch all mmsys clock driver to platform probing
- fix mt8173 platform driver remove function
- fix probe defer path in HDMI driver
- fix probe defer path in mtk_mdp_comp
- fix identation of error messages

Changes in v5:
- fix missing regmap accessors in drm diver (patch 1)
- omit probe deffered warning on all drivers (patch 5)
- update drm and clk bindings (patch 6 and 7)
- put mmsys clock part in dts child node of mmsys. Only done
for HW where no dts backport compatible breakage is expected
(either DRM driver not yet implemented or no HW available to
the public) (patch 9 to 12)

Changes in v4:
- use platform device to probe clock driver
- add Acked-by CK Hu for the probe deferred patch

Changes in v3:
- fix kconfig typo (shame on me)
- delete __initconst from mm_clocks as converted to a platform driver

Changes in v2:
- add binding documentation
- ddp: use regmap_update_bits
- ddp: ignore EPROBE_DEFER on clock probing
- mfd: delete mmsys_private
- add Reviewed-by and Acked-by tags

Matthias Brugger (13):
  dt-bindings: arm: move mmsys description to display
  dt-bindings: display: mediatek: Add mmsys binding description
  dt-bindings: mediatek: Add compatible for mt7623
  drm/mediatek: Use regmap for register access
  drm: mediatek: Omit warning on probe defers
  media: mtk-mdp: Check return value of of_clk_get
  clk: mediatek: mt2701: switch mmsys to platform device probing
  clk: mediatek: mt2712e: switch to platform device probing
  clk: mediatek: mt6779: switch mmsys to platform device probing
  clk: mediatek: mt6797: switch to platform device probing
  clk: mediatek: mt8183: switch mmsys to platform device probing
  clk: mediatek: mt8173: switch mmsys to platform device probing
  drm/mediatek: Add support for mmsys through a pdev

 .../display/mediatek/mediatek,disp.txt        |  5 ++
 .../mediatek/mediatek,mmsys.txt               |  9 +---
 drivers/clk/mediatek/clk-mt2701-mm.c          | 34 ++++++++----
 drivers/clk/mediatek/clk-mt2712-mm.c          | 32 +++++++----
 drivers/clk/mediatek/clk-mt6779-mm.c          | 32 +++++++----
 drivers/clk/mediatek/clk-mt6797-mm.c          | 34 ++++++++----
 drivers/clk/mediatek/clk-mt8173.c             | 45 +++++++++++++---
 drivers/clk/mediatek/clk-mt8183-mm.c          | 30 +++++++----
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |  5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            | 12 +++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c        | 53 ++++++++-----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h        |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 35 +++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |  8 ++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  4 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |  6 +++
 20 files changed, 246 insertions(+), 120 deletions(-)
 rename Documentation/devicetree/bindings/{arm => display}/mediatek/mediatek,mmsys.txt (61%)

-- 
2.24.1

