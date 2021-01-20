Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3F32FCBD5
	for <lists+linux-clk@lfdr.de>; Wed, 20 Jan 2021 08:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729246AbhATHlH (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 20 Jan 2021 02:41:07 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16052 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728945AbhATHf0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2021 02:35:26 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6007dd160001>; Tue, 19 Jan 2021 23:34:46 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan
 2021 07:34:41 +0000
Received: from jckuo-lt.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 20 Jan 2021 07:34:37 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, <linux-clk@vger.kernel.org>,
        JC Kuo <jckuo@nvidia.com>, Thierry Reding <treding@nvidia.com>
Subject: [PATCH v7 05/14] phy: tegra: xusb: Add Tegra210 lane_iddq operation
Date:   Wed, 20 Jan 2021 15:34:05 +0800
Message-ID: <20210120073414.69208-6-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120073414.69208-1-jckuo@nvidia.com>
References: <20210120073414.69208-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611128086; bh=8KiwaVKqTDtnZNXhGZas54cVFH4JK23hWgeiPL+7BL8=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=M+a2EYOR9WV2oZeVEYySQFGoc6eqH5a45ac5Evn7y5Pj38AGqiujLoCMkZKzVmBGp
         hRSPgVIFGScSU5JjuPuHzPjzMKppurxE928KNZbkrNGRMptSKuqtrYQqg5n8Drrapg
         YV9KVzsi1RjNti4XXdbTQmhXfsj6qhz/ZJDbyyOrfuWwTv5ou5XkZk+I3QzzQEy+T7
         5ekznhswSIiWavSC5MtLfyKxRNWk0zM22dCAKo5yW+ryOCY+E7Mb04TAoQCdxw00eq
         rNeDaX4XXfVY7ZEYgwS+m/wLOC/MpLvp8UGWQ5PwGrl9vbfbQTPti9UzxAIOVHqg18
         iKXH/c/LLHoNg==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As per Tegra210 TRM, before changing lane assignments, driver should
keep lanes in IDDQ and sleep state; after changing lane assignments,
driver should bring lanes out of IDDQ.
This commit implements the required operations.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
v7:
   no change
v6:
   no change
v5:
   no change
v4:
   no change
v3:
   add 'misc_ctl2' data member to UPHY lane for carrying MISC_PAD_PX_CTL2 o=
ffset
   tegra210_uphy_lane_iddq_[enable/disable]() to access 'misc_ctl2' data me=
mber

 drivers/phy/tegra/xusb-tegra210.c | 82 ++++++++++++++++++++++++++++---
 drivers/phy/tegra/xusb.c          |  6 +++
 drivers/phy/tegra/xusb.h          |  6 +++
 3 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-teg=
ra210.c
index faacb866cd1f..b038d032fea1 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -198,6 +198,18 @@
 #define XUSB_PADCTL_UPHY_MISC_PAD_CTL1_AUX_RX_TERM_EN BIT(18)
 #define XUSB_PADCTL_UPHY_MISC_PAD_CTL1_AUX_RX_MODE_OVRD BIT(13)
=20
+#define XUSB_PADCTL_UPHY_MISC_PAD_PX_CTL2(x) (0x464 + (x) * 0x40)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ BIT(0)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ_OVRD BIT(1)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_MASK (0x3 << 4)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_VAL (0x3 << 4)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_PWR_OVRD BIT(24)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ BIT(8)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ_OVRD BIT(9)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_MASK (0x3 << 12)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_VAL (0x3 << 12)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_PWR_OVRD BIT(25)
+
 #define XUSB_PADCTL_UPHY_PLL_S0_CTL1 0x860
=20
 #define XUSB_PADCTL_UPHY_PLL_S0_CTL2 0x864
@@ -209,6 +221,7 @@
 #define XUSB_PADCTL_UPHY_PLL_S0_CTL8 0x87c
=20
 #define XUSB_PADCTL_UPHY_MISC_PAD_S0_CTL1 0x960
+#define XUSB_PADCTL_UPHY_MISC_PAD_S0_CTL2 0x964
=20
 #define XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(x) (0xa60 + (x) * 0x40)
 #define XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT 16
@@ -1640,6 +1653,55 @@ static const struct tegra_xusb_pad_soc tegra210_hsic=
_pad =3D {
 	.ops =3D &tegra210_hsic_ops,
 };
=20
+static void tegra210_uphy_lane_iddq_enable(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
+	u32 value;
+
+	value =3D padctl_readl(padctl, lane->soc->regs.misc_ctl2);
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_PWR_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_PWR_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_MASK;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_VAL;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_MASK;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_VAL;
+	padctl_writel(padctl, value, lane->soc->regs.misc_ctl2);
+}
+
+static void tegra210_uphy_lane_iddq_disable(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
+	u32 value;
+
+	value =3D padctl_readl(padctl, lane->soc->regs.misc_ctl2);
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ_OVRD;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ_OVRD;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_PWR_OVRD;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_PWR_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_MASK;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_VAL;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_MASK;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_VAL;
+	padctl_writel(padctl, value, lane->soc->regs.misc_ctl2);
+}
+
+#define TEGRA210_UPHY_LANE(_name, _offset, _shift, _mask, _type, _misc)	\
+	{								\
+		.name =3D _name,						\
+		.offset =3D _offset,					\
+		.shift =3D _shift,					\
+		.mask =3D _mask,						\
+		.num_funcs =3D ARRAY_SIZE(tegra210_##_type##_functions),	\
+		.funcs =3D tegra210_##_type##_functions,			\
+		.regs.misc_ctl2 =3D _misc,				\
+	}
+
 static const char *tegra210_pcie_functions[] =3D {
 	"pcie-x1",
 	"usb3-ss",
@@ -1648,13 +1710,13 @@ static const char *tegra210_pcie_functions[] =3D {
 };
=20
 static const struct tegra_xusb_lane_soc tegra210_pcie_lanes[] =3D {
-	TEGRA210_LANE("pcie-0", 0x028, 12, 0x3, pcie),
-	TEGRA210_LANE("pcie-1", 0x028, 14, 0x3, pcie),
-	TEGRA210_LANE("pcie-2", 0x028, 16, 0x3, pcie),
-	TEGRA210_LANE("pcie-3", 0x028, 18, 0x3, pcie),
-	TEGRA210_LANE("pcie-4", 0x028, 20, 0x3, pcie),
-	TEGRA210_LANE("pcie-5", 0x028, 22, 0x3, pcie),
-	TEGRA210_LANE("pcie-6", 0x028, 24, 0x3, pcie),
+	TEGRA210_UPHY_LANE("pcie-0", 0x028, 12, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(0)),
+	TEGRA210_UPHY_LANE("pcie-1", 0x028, 14, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(1)),
+	TEGRA210_UPHY_LANE("pcie-2", 0x028, 16, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(2)),
+	TEGRA210_UPHY_LANE("pcie-3", 0x028, 18, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(3)),
+	TEGRA210_UPHY_LANE("pcie-4", 0x028, 20, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(4)),
+	TEGRA210_UPHY_LANE("pcie-5", 0x028, 22, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(5)),
+	TEGRA210_UPHY_LANE("pcie-6", 0x028, 24, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(6)),
 };
=20
 static struct tegra_xusb_usb3_port *
@@ -1815,6 +1877,8 @@ static void tegra210_pcie_lane_remove(struct tegra_xu=
sb_lane *lane)
 static const struct tegra_xusb_lane_ops tegra210_pcie_lane_ops =3D {
 	.probe =3D tegra210_pcie_lane_probe,
 	.remove =3D tegra210_pcie_lane_remove,
+	.iddq_enable =3D tegra210_uphy_lane_iddq_enable,
+	.iddq_disable =3D tegra210_uphy_lane_iddq_disable,
 };
=20
 static int tegra210_pcie_phy_init(struct phy *phy)
@@ -1939,7 +2003,7 @@ static const struct tegra_xusb_pad_soc tegra210_pcie_=
pad =3D {
 };
=20
 static const struct tegra_xusb_lane_soc tegra210_sata_lanes[] =3D {
-	TEGRA210_LANE("sata-0", 0x028, 30, 0x3, pcie),
+	TEGRA210_UPHY_LANE("sata-0", 0x028, 30, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_S0_CTL2),
 };
=20
 static struct tegra_xusb_lane *
@@ -1978,6 +2042,8 @@ static void tegra210_sata_lane_remove(struct tegra_xu=
sb_lane *lane)
 static const struct tegra_xusb_lane_ops tegra210_sata_lane_ops =3D {
 	.probe =3D tegra210_sata_lane_probe,
 	.remove =3D tegra210_sata_lane_remove,
+	.iddq_enable =3D tegra210_uphy_lane_iddq_enable,
+	.iddq_disable =3D tegra210_uphy_lane_iddq_disable,
 };
=20
 static int tegra210_sata_phy_init(struct phy *phy)
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 3110aafa8cf6..a34d304677bb 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -321,11 +321,17 @@ static void tegra_xusb_lane_program(struct tegra_xusb=
_lane *lane)
 	if (soc->num_funcs < 2)
 		return;
=20
+	if (lane->pad->ops->iddq_enable)
+		lane->pad->ops->iddq_enable(lane);
+
 	/* choose function */
 	value =3D padctl_readl(padctl, soc->offset);
 	value &=3D ~(soc->mask << soc->shift);
 	value |=3D lane->function << soc->shift;
 	padctl_writel(padctl, value, soc->offset);
+
+	if (lane->pad->ops->iddq_disable)
+		lane->pad->ops->iddq_disable(lane);
 }
=20
 static void tegra_xusb_pad_program(struct tegra_xusb_pad *pad)
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index ccb5dc9b1220..e789d5ff4eb8 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -35,6 +35,10 @@ struct tegra_xusb_lane_soc {
=20
 	const char * const *funcs;
 	unsigned int num_funcs;
+
+	struct {
+		unsigned int misc_ctl2;
+	} regs;
 };
=20
 struct tegra_xusb_lane {
@@ -126,6 +130,8 @@ struct tegra_xusb_lane_ops {
 					 struct device_node *np,
 					 unsigned int index);
 	void (*remove)(struct tegra_xusb_lane *lane);
+	void (*iddq_enable)(struct tegra_xusb_lane *lane);
+	void (*iddq_disable)(struct tegra_xusb_lane *lane);
 };
=20
 bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane, const char *funct=
ion);
--=20
2.25.1

