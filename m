Return-Path: <linux-clk+bounces-11174-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D51F695F185
	for <lists+linux-clk@lfdr.de>; Mon, 26 Aug 2024 14:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FE081F213BA
	for <lists+linux-clk@lfdr.de>; Mon, 26 Aug 2024 12:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564EF18890F;
	Mon, 26 Aug 2024 12:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="kJSvPvHA"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D56188586;
	Mon, 26 Aug 2024 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724675921; cv=none; b=XN0StyF5GtFNrOpMFh5LyXzKa1ng0LqqSsa2J2/sLy0dRQnndaezBNdZmWK5bL/zuPyUKSvYSb4y2KPpKv35rZPL7VbcO4qz8pzInwmpeIWg1s7MOJwNnyXdu90DLyVuAQShxZT4ozvsuxsjjXncynqGkSJxowrMCjJkqfdyqdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724675921; c=relaxed/simple;
	bh=41srDK0MuDn8Elb7xD1mGmMH+Sw4nupfzQfp74UxsXY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YVgTbATG6Q67s28YPT7k6EWR9YeTzfZkrT7Orvfk5I3z4A0PpXQl0K7AQWByy4UWNPKsXOqY9JEn3DRqd0ekhrMQlFb9Pq6OIR/HbamvHot4DKmNb4KeVIFmd4OBSL2tFU81yEGI8UfqQSOFteXigEkHcObDt2F9mw3MNKJf4EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=kJSvPvHA; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1724675917; x=1724935117;
	bh=h/LZjiViK1KTa6JiCSBo81f43s9SkDGG36Wi8VELnlc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kJSvPvHAN9W9tTPypmczzn8CP/pUIs8eoDXoR11bunadPSf/yYUWVjH5qs9ZqurMs
	 eN8LoF5DiCDyvMGpjV23e7OSripcqbsZgUZj8h0pXLq0pfH6Y66BJml4joPJ+BVaiz
	 oqtQDJ91WcAW8YsutLwhMcyaI3c3SBD7h+VCPoTD3ea67eqtTd/Uj4xgqtbj7jKxzw
	 g2K5m+K54Fguhc7hNmvvukyZAZRWrYRA3uqVkp1usOsHUmT/IEIjkgTyGqKl0SsAQH
	 lkS+0JrXP0eU4mkNFyRwejf+2j3I3XSjih+15OYbLBJcE6fVQ7JK8d8PCRhtL8yj7P
	 7EAvwOzLto5vg==
Date: Mon, 26 Aug 2024 12:38:32 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH v3 6/9] clk: clocking-wizard: add user clock monitor support
Message-ID: <20240826123602.1872-7-hpausten@protonmail.com>
In-Reply-To: <20240826123602.1872-1-hpausten@protonmail.com>
References: <20240826123602.1872-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: c6c0b939de3551c63045bbf6a94385231923af91
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Xilinx clocking wizard IP core supports monitoring of up to four
optional user clock inputs, with a corresponding interrupt for
notification in change of clock state (stop, underrun, overrun or
glitch). Give access to this monitor logic through use of an auxiliary
device.

Use presence of the user monitor interrupt description in devicetree to
indicate whether or not the auxiliary device should be registered. Also,
this functionality is only supported from v6.0 onwards, so add
indication of support to the device match data, in order to be tied to
the utilised compatible string.

Signed-off-by: Harry Austen <hpausten@protonmail.com>
---
 drivers/clk/xilinx/Kconfig                 |  1 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 60 ++++++++++++++++++++--
 2 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/xilinx/Kconfig b/drivers/clk/xilinx/Kconfig
index 051756953558b..87f507bd9b6f3 100644
--- a/drivers/clk/xilinx/Kconfig
+++ b/drivers/clk/xilinx/Kconfig
@@ -21,6 +21,7 @@ config COMMON_CLK_XLNX_CLKWZRD
 =09tristate "Xilinx Clocking Wizard"
 =09depends on OF
 =09depends on HAS_IOMEM
+=09select AUXILIARY_BUS
 =09help
 =09  Support for the Xilinx Clocking Wizard IP core clock generator.
 =09  Adds support for clocking wizard and compatible.
diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilin=
x/clk-xlnx-clock-wizard.c
index 1a65a7d153c35..35dad2fda254b 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -8,6 +8,7 @@
  *
  */
=20
+#include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
@@ -129,6 +130,7 @@ enum clk_wzrd_int_clks {
  * @clks_internal:=09Internal clocks
  * @speed_grade:=09Speed grade of the device
  * @suspended:=09=09Flag indicating power state of the device
+ * @adev:=09=09User clock monitor auxiliary device
  * @clk_data:=09=09Output clock data
  */
 struct clk_wzrd {
@@ -139,6 +141,7 @@ struct clk_wzrd {
 =09struct clk_hw *clks_internal[wzrd_clk_int_max];
 =09unsigned int speed_grade;
 =09bool suspended;
+=09struct auxiliary_device adev;
 =09struct clk_hw_onecell_data clk_data;
 };
=20
@@ -171,8 +174,9 @@ struct clk_wzrd_divider {
 =09spinlock_t *lock;  /* divider lock */
 };
=20
-struct versal_clk_data {
+struct clk_wzrd_data {
 =09bool is_versal;
+=09bool supports_monitor;
 };
=20
 #define to_clk_wzrd(_nb) container_of(_nb, struct clk_wzrd, nb)
@@ -958,16 +962,58 @@ static int __maybe_unused clk_wzrd_resume(struct devi=
ce *dev)
 static SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
 =09=09=09 clk_wzrd_resume);
=20
-static const struct versal_clk_data versal_data =3D {
-=09.is_versal=09=3D true,
+static const struct clk_wzrd_data version_6_0_data =3D {
+=09.is_versal=09=09=3D false,
+=09.supports_monitor=09=3D true,
 };
=20
+static const struct clk_wzrd_data versal_data =3D {
+=09.is_versal=09=09=3D true,
+=09.supports_monitor=09=3D true,
+};
+
+static void clk_wzrd_unregister_adev(void *_adev)
+{
+=09struct auxiliary_device *adev =3D _adev;
+
+=09auxiliary_device_delete(adev);
+=09auxiliary_device_uninit(adev);
+}
+
+static int clk_wzrd_setup_monitor(struct platform_device *pdev)
+{
+=09struct device *dev =3D &pdev->dev;
+=09const struct clk_wzrd_data *data =3D device_get_match_data(dev);
+=09struct clk_wzrd *clk_wzrd =3D dev_get_drvdata(dev);
+=09struct auxiliary_device *adev =3D &clk_wzrd->adev;
+=09int ret;
+
+=09if (!data || !data->supports_monitor)
+=09=09return 0;
+
+=09adev->name =3D "clk-mon";
+=09adev->dev.parent =3D dev;
+=09adev->dev.platform_data =3D (__force void *)clk_wzrd->base;
+
+=09ret =3D auxiliary_device_init(adev);
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D auxiliary_device_add(adev);
+=09if (ret) {
+=09=09auxiliary_device_uninit(adev);
+=09=09return ret;
+=09}
+
+=09return devm_add_action_or_reset(dev, clk_wzrd_unregister_adev, adev);
+}
+
 static int clk_wzrd_register_output_clocks(struct device *dev, int nr_outp=
uts)
 {
 =09const char *clkout_name, *clk_name, *clk_mul_name;
 =09struct clk_wzrd *clk_wzrd =3D dev_get_drvdata(dev);
 =09u32 regl, regh, edge, regld, reghd, edged, div;
-=09const struct versal_clk_data *data;
+=09const struct clk_wzrd_data *data;
 =09unsigned long flags =3D 0;
 =09bool is_versal =3D false;
 =09void __iomem *ctrl_reg;
@@ -1170,6 +1216,10 @@ static int clk_wzrd_probe(struct platform_device *pd=
ev)
 =09=09return -EINVAL;
 =09}
=20
+=09ret =3D clk_wzrd_setup_monitor(pdev);
+=09if (ret)
+=09=09return dev_err_probe(&pdev->dev, ret, "failed to setup monitor\n");
+
 =09ret =3D clk_wzrd_register_output_clocks(&pdev->dev, nr_outputs);
 =09if (ret)
 =09=09return ret;
@@ -1204,7 +1254,7 @@ static const struct of_device_id clk_wzrd_ids[] =3D {
 =09{ .compatible =3D "xlnx,versal-clk-wizard", .data =3D &versal_data },
 =09{ .compatible =3D "xlnx,clocking-wizard"   },
 =09{ .compatible =3D "xlnx,clocking-wizard-v5.2"   },
-=09{ .compatible =3D "xlnx,clocking-wizard-v6.0"  },
+=09{ .compatible =3D "xlnx,clocking-wizard-v6.0", .data =3D &version_6_0_d=
ata },
 =09{ },
 };
 MODULE_DEVICE_TABLE(of, clk_wzrd_ids);
--=20
2.46.0



