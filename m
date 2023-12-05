Return-Path: <linux-clk+bounces-863-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69050804EDB
	for <lists+linux-clk@lfdr.de>; Tue,  5 Dec 2023 10:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90D111C20DD5
	for <lists+linux-clk@lfdr.de>; Tue,  5 Dec 2023 09:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3284C3A4;
	Tue,  5 Dec 2023 09:55:36 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 10E2BA0;
	Tue,  5 Dec 2023 01:55:32 -0800 (PST)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
	by sakura.ysato.name (Postfix) with ESMTPSA id 2DA221C066B;
	Tue,  5 Dec 2023 18:46:48 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lee Jones <lee@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Baoquan He <bhe@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Guo Ren <guoren@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Azeem Shaikh <azeemshaikh38@gmail.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Bin Meng <bmeng@tinylab.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Tom Rix <trix@redhat.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [DO NOT MERGE v5 23/37] mfd: sm501: Convert platform_data to OF property
Date: Tue,  5 Dec 2023 18:45:42 +0900
Message-Id: <68532082074b0c8fe9945b481678aab77520f517.1701768028.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1701768028.git.ysato@users.sourceforge.jp>
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various parameters of SM501 can be set using platform_data,
so parameters cannot be passed in the DeviceTree target.
Expands the parameters set in platform_data so that they can be
specified using DeviceTree properties.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 drivers/mfd/sm501.c           | 99 +++++++++++++++++++++++++++++++++++
 drivers/video/fbdev/sm501fb.c | 82 +++++++++++++++++++++++++++++
 2 files changed, 181 insertions(+)

diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index 28027982cf69..f0104fdf0f34 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1370,6 +1370,99 @@ static int sm501_init_dev(struct sm501_devdata *sm)
 	return 0;
 }
 
+static void sm501_of_read_reg_init(struct device_node *np,
+				   const char *propname, struct sm501_reg_init *val)
+{
+	u32 u32_val[2];
+
+	if (!of_property_read_u32_array(np, propname, u32_val, sizeof(u32_val))) {
+		val->set = u32_val[0];
+		val->mask = u32_val[1];
+	}
+}
+
+/* Read GPIO I2C configuration */
+static int sm501_parse_dt_gpio_i2c(struct device *dev, struct sm501_platdata *plat,
+				   struct device_node *np)
+{
+	struct sm501_platdata_gpio_i2c *gpio_i2c_p;
+	struct property *prop;
+	u32 gpio_i2c[5];
+	const __be32 *p;
+	unsigned int i;
+	u32 i2c_nr;
+
+	prop = of_find_property(np, "smi,gpio-i2c", NULL);
+	if (!prop)
+		return 0;
+
+	i2c_nr = of_property_count_u32_elems(np, "smi,gpio-i2c");
+
+	/* GPIO I2C define 5 words per channel. */
+	if (i2c_nr % 5)
+		return -EINVAL;
+	i2c_nr /= 5;
+	plat->gpio_i2c = devm_kzalloc(dev, sizeof(*plat->gpio_i2c) * i2c_nr,
+				      GFP_KERNEL);
+	if (!plat->gpio_i2c)
+		return -ENOMEM;
+
+	plat->gpio_i2c_nr = i2c_nr;
+	gpio_i2c_p = plat->gpio_i2c;
+
+	for (; i2c_nr > 0; i2c_nr--) {
+		for (i = 0; i < ARRAY_SIZE(gpio_i2c); i++) {
+			p = of_prop_next_u32(prop, p, &gpio_i2c[i]);
+			if (!p)
+				return -EINVAL;
+		}
+		gpio_i2c_p->bus_num = gpio_i2c[0];
+		gpio_i2c_p->pin_sda = gpio_i2c[1];
+		gpio_i2c_p->pin_scl = gpio_i2c[2];
+		gpio_i2c_p->udelay  = gpio_i2c[3];
+		gpio_i2c_p->timeout = gpio_i2c[4];
+		gpio_i2c_p++;
+	}
+	return 0;
+}
+
+/* Build platform_data from OF property */
+static int sm501_parse_dt(struct sm501_devdata *sm, struct device_node *np)
+{
+	struct sm501_platdata *plat;
+	u32 u32_val;
+	int ret;
+
+	plat = devm_kzalloc(sm->dev, sizeof(*plat), GFP_KERNEL);
+	if (!plat)
+		return -ENOMEM;
+
+	plat->init = devm_kzalloc(sm->dev, sizeof(*plat->init), GFP_KERNEL);
+	if (!plat->init)
+		return -ENOMEM;
+
+	if (!of_property_read_u32(np, "smi,devices", &u32_val))
+		plat->init->devices = u32_val;
+	if (!of_property_read_u32(np, "smi,mclk", &u32_val))
+		plat->init->mclk = u32_val;
+	if (!of_property_read_u32(np, "smi,m1xclk", &u32_val))
+		plat->init->m1xclk = u32_val;
+
+	sm501_of_read_reg_init(np, "smi,misc-timing", &plat->init->misc_timing);
+	sm501_of_read_reg_init(np, "smi,misc-control", &plat->init->misc_control);
+	sm501_of_read_reg_init(np, "smi,gpio-low", &plat->init->gpio_low);
+	sm501_of_read_reg_init(np, "smi,gpio-high", &plat->init->gpio_high);
+
+	if (IS_ENABLED(CONFIG_MFD_SM501_GPIO) &&
+	    (plat->init->devices & SM501_USE_GPIO)) {
+		ret = sm501_parse_dt_gpio_i2c(sm->dev, plat, np);
+		if (ret)
+			return ret;
+	}
+	sm->platdata = plat;
+	return 0;
+}
+
 static int sm501_plat_probe(struct platform_device *dev)
 {
 	struct sm501_devdata *sm;
@@ -1406,6 +1499,12 @@ static int sm501_plat_probe(struct platform_device *dev)
 		goto err_res;
 	}
 
+	if (IS_ENABLED(CONFIG_OF) && dev->dev.of_node) {
+		ret = sm501_parse_dt(sm, dev->dev.of_node);
+		if (ret)
+			goto err_res;
+	}
+
 	platform_set_drvdata(dev, sm);
 
 	sm->regs = ioremap(sm->io_res->start, resource_size(sm->io_res));
diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index d6fdc1737cd2..d35285819d28 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -1932,6 +1932,82 @@ static int sm501fb_start_one(struct sm501fb_info *info,
 	return 0;
 }
 
+#if defined(CONFIG_OF)
+/* parse CRT / panel configuration */
+static struct sm501_platdata_fbsub *dt_fbsub(struct device *dev,
+					     struct device_node *np,
+					     const char *name)
+{
+	struct sm501_platdata_fbsub *fbsub = NULL;
+	struct fb_videomode *def_mode = NULL;
+	struct device_node *child;
+	const void *p_edid;
+	u32 flags = 0;
+	u32 bpp = 0;
+	int len;
+
+	child = of_get_child_by_name(np, name);
+	if (child == NULL)
+		return NULL;
+
+	p_edid = of_get_property(child, "edid", &len);
+	if (p_edid && len == EDID_LENGTH) {
+		struct fb_monspecs *specs;
+		u8 *edid;
+
+		edid = kmemdup(p_edid, EDID_LENGTH, GFP_KERNEL);
+		if (edid) {
+			specs = kzalloc(sizeof(*specs), GFP_KERNEL);
+			if (specs) {
+				fb_edid_to_monspecs(edid, specs);
+				def_mode = specs->modedb;
+			}
+		}
+		kfree(edid);
+	}
+
+	of_property_read_u32(child, "bpp", &bpp);
+
+	/* If flags property is obtained, fbsub is returned. */
+	if (!of_property_read_u32(child, "smi,flags", &flags)) {
+		fbsub = devm_kzalloc(dev, sizeof(*fbsub), GFP_KERNEL);
+		if (fbsub) {
+			fbsub->def_mode = def_mode;
+			fbsub->def_bpp = bpp;
+			fbsub->flags = flags;
+		}
+	}
+	return fbsub;
+}
+
+/* Build platform_data from OF property */
+static struct sm501_platdata_fb *pdata_from_dt(struct device *dev, struct device_node *np)
+{
+	enum sm501_fb_routing fb_route = SM501_FB_OWN;
+	struct sm501_platdata_fb *pdata = NULL;
+	struct sm501_platdata_fbsub *fb_crt;
+	struct sm501_platdata_fbsub *fb_pnl;
+	unsigned int flags = 0;
+
+	if (of_property_read_bool(np, "route-crt-panel"))
+		fb_route = SM501_FB_CRT_PANEL;
+	if (of_property_read_bool(np, "swap-fb-endian"))
+		flags = SM501_FBPD_SWAP_FB_ENDIAN;
+	fb_crt = dt_fbsub(dev, np, "crt");
+	fb_pnl = dt_fbsub(dev, np, "panel");
+	if (fb_crt || fb_pnl) {
+		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+		if (pdata) {
+			pdata->fb_route = fb_route;
+			pdata->flags = flags;
+			pdata->fb_crt = fb_crt;
+			pdata->fb_pnl = fb_pnl;
+		}
+	}
+	return pdata;
+}
+#endif
+
 static int sm501fb_probe(struct platform_device *pdev)
 {
 	struct sm501fb_info *info;
@@ -1974,6 +2050,12 @@ static int sm501fb_probe(struct platform_device *pdev)
 				if (info->edid_data)
 					found = 1;
 			}
+			/* Get platform data compatible configuration */
+			if (!found) {
+				info->pdata = pdata_from_dt(dev, np);
+				if (info->pdata)
+					found = 1;
+			}
 		}
 #endif
 		if (!found) {
-- 
2.39.2


