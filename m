Return-Path: <linux-clk+bounces-9853-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE67938125
	for <lists+linux-clk@lfdr.de>; Sat, 20 Jul 2024 14:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ECDD1F21DF8
	for <lists+linux-clk@lfdr.de>; Sat, 20 Jul 2024 12:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFF212DD9B;
	Sat, 20 Jul 2024 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="wgpJ4DRs"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B07137C35;
	Sat, 20 Jul 2024 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721476912; cv=none; b=G55kH+GGo6fNs9/z/yk4dLokbbMJulSLDAqjKpr+2gHbpYzB6DH56dTVTH9alzmE6gSSDFVeIPUcNfq8WfpqxWETR5UdKTED0/ebPLQzVLE2F8u5jnadeWSsih7bsIQCWJgcdmpktkJR+H4oqPx3U1lj5EUxSRsHMQLyMqnALEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721476912; c=relaxed/simple;
	bh=0sWicMMPqZ+iKUK3gUd+eRbBtj+3IUdRxGUqcHvTq0k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gw9fnlQ+wcjnBBxzqoVKQnjjKvO9A7mCzuNn9bHuaXw8Caw0MNWAskGYnPF4d6WPKc9nTpnjObaOrzeLHbl8gNHUx2LM0k6sGXvM1jDlahS+SqFsxT7nhBY7t76HPuScrsDp1GlbpirvgcgormYs1G8uypZ3io2pMf3neNhD71Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=wgpJ4DRs; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1721476908; x=1721736108;
	bh=OJhXXJ3CRFLOpwYNrHCaqe+k//xwIfEAuyRfWHYLbR0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=wgpJ4DRsszif0r4ni08wdgFdF0it0PMvIaLOtUGyDo2pxiqVRPQgt34RJBGELuDx+
	 yoPaIcDPKfAUCpkrNaggoWeTlrDVrWr/qNZadVguwlTHMJ2JM+LqzZ99vgY/hYXUKs
	 I5JWk3T0Mkb2nwxHG8uWbuvjq/UvMhIgzUx21lD9TRw0998yOw60mukcw3M35LMNiq
	 EURAlfX24mALokRguIeGQ0PtX2e7t3qYsOfYXflTGIIiK0m0XGMPYrfYMVx+J38D3F
	 yPUI7+vu/ylanNGo5ipFbRWBU5Uj5gjAKeviZifnPVvbQacSPjMizngmu1F3L9P/Z1
	 UBzpEHQOWnKpQ==
Date: Sat, 20 Jul 2024 12:01:42 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH 3/7] clk: clocking-wizard: move clock registration to separate function
Message-ID: <20240720120048.36758-4-hpausten@protonmail.com>
In-Reply-To: <20240720120048.36758-1-hpausten@protonmail.com>
References: <20240720120048.36758-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: c80efb368875e8f4269a35c90aae34cc8da0ad7b
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Provide clear separation of dynamic reconfiguration logic, by moving its
setup procedure to its own dedicated function.

Signed-off-by: Harry Austen <hpausten@protonmail.com>
---
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 151 +++++++++++----------
 1 file changed, 79 insertions(+), 72 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilin=
x/clk-xlnx-clock-wizard.c
index 30c5cc9dcd7e9..7b262d73310fe 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -962,76 +962,30 @@ static const struct versal_clk_data versal_data =3D {
 =09.is_versal=09=3D true,
 };
=20
-static int clk_wzrd_probe(struct platform_device *pdev)
+static int clk_wzrd_register_output_clocks(struct device *dev, int nr_outp=
uts)
 {
 =09const char *clkout_name, *clk_name, *clk_mul_name;
+=09struct clk_wzrd *clk_wzrd =3D dev_get_drvdata(dev);
 =09u32 regl, regh, edge, regld, reghd, edged, div;
-=09struct device_node *np =3D pdev->dev.of_node;
 =09const struct versal_clk_data *data;
-=09struct clk_wzrd *clk_wzrd;
 =09unsigned long flags =3D 0;
+=09bool is_versal =3D false;
 =09void __iomem *ctrl_reg;
 =09u32 reg, reg_f, mult;
-=09bool is_versal =3D false;
-=09unsigned long rate;
-=09int nr_outputs;
-=09int i, ret;
-
-=09clk_wzrd =3D devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
-=09if (!clk_wzrd)
-=09=09return -ENOMEM;
-=09platform_set_drvdata(pdev, clk_wzrd);
-
-=09clk_wzrd->base =3D devm_platform_ioremap_resource(pdev, 0);
-=09if (IS_ERR(clk_wzrd->base))
-=09=09return PTR_ERR(clk_wzrd->base);
-
-=09ret =3D of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_g=
rade);
-=09if (!ret) {
-=09=09if (clk_wzrd->speed_grade < 1 || clk_wzrd->speed_grade > 3) {
-=09=09=09dev_warn(&pdev->dev, "invalid speed grade '%d'\n",
-=09=09=09=09 clk_wzrd->speed_grade);
-=09=09=09clk_wzrd->speed_grade =3D 0;
-=09=09}
-=09}
+=09int i;
=20
-=09clk_wzrd->clk_in1 =3D devm_clk_get(&pdev->dev, "clk_in1");
-=09if (IS_ERR(clk_wzrd->clk_in1))
-=09=09return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
-=09=09=09=09     "clk_in1 not found\n");
-
-=09clk_wzrd->axi_clk =3D devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
-=09if (IS_ERR(clk_wzrd->axi_clk))
-=09=09return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
-=09=09=09=09     "s_axi_aclk not found\n");
-=09rate =3D clk_get_rate(clk_wzrd->axi_clk);
-=09if (rate > WZRD_ACLK_MAX_FREQ) {
-=09=09dev_err(&pdev->dev, "s_axi_aclk frequency (%lu) too high\n",
-=09=09=09rate);
-=09=09return -EINVAL;
-=09}
-
-=09data =3D device_get_match_data(&pdev->dev);
+=09data =3D device_get_match_data(dev);
 =09if (data)
 =09=09is_versal =3D data->is_versal;
=20
-=09ret =3D of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
-=09if (ret || nr_outputs > WZRD_NUM_OUTPUTS)
-=09=09return -EINVAL;
-
-=09clk_wzrd->clk_data =3D devm_kzalloc(&pdev->dev, struct_size(clk_wzrd->c=
lk_data, hws,
-=09=09=09=09=09  nr_outputs), GFP_KERNEL);
-=09if (!clk_wzrd->clk_data)
-=09=09return -ENOMEM;
-
-=09clkout_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_out0", dev_n=
ame(&pdev->dev));
+=09clkout_name =3D devm_kasprintf(dev, GFP_KERNEL, "%s_out0", dev_name(dev=
));
 =09if (!clkout_name)
 =09=09return -ENOMEM;
=20
 =09if (is_versal) {
 =09=09if (nr_outputs =3D=3D 1) {
 =09=09=09clk_wzrd->clk_data->hws[0] =3D clk_wzrd_ver_register_divider
-=09=09=09=09(&pdev->dev, clkout_name,
+=09=09=09=09(dev, clkout_name,
 =09=09=09=09__clk_get_name(clk_wzrd->clk_in1), 0,
 =09=09=09=09clk_wzrd->base, WZRD_CLK_CFG_REG(is_versal, 3),
 =09=09=09=09WZRD_CLKOUT_DIVIDE_SHIFT,
@@ -1039,7 +993,7 @@ static int clk_wzrd_probe(struct platform_device *pdev=
)
 =09=09=09=09CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
 =09=09=09=09DIV_ALL, &clkwzrd_lock);
=20
-=09=09=09goto out;
+=09=09=09return 0;
 =09=09}
 =09=09/* register multiplier */
 =09=09edge =3D !!(readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 0)) &
@@ -1064,7 +1018,7 @@ static int clk_wzrd_probe(struct platform_device *pde=
v)
 =09} else {
 =09=09if (nr_outputs =3D=3D 1) {
 =09=09=09clk_wzrd->clk_data->hws[0] =3D clk_wzrd_register_divider
-=09=09=09=09(&pdev->dev, clkout_name,
+=09=09=09=09(dev, clkout_name,
 =09=09=09=09__clk_get_name(clk_wzrd->clk_in1), 0,
 =09=09=09=09clk_wzrd->base, WZRD_CLK_CFG_REG(is_versal, 3),
 =09=09=09=09WZRD_CLKOUT_DIVIDE_SHIFT,
@@ -1072,7 +1026,7 @@ static int clk_wzrd_probe(struct platform_device *pde=
v)
 =09=09=09=09CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
 =09=09=09=09DIV_ALL, &clkwzrd_lock);
=20
-=09=09=09goto out;
+=09=09=09return 0;
 =09=09}
 =09=09reg =3D readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 0));
 =09=09reg_f =3D reg & WZRD_CLKFBOUT_FRAC_MASK;
@@ -1083,19 +1037,19 @@ static int clk_wzrd_probe(struct platform_device *p=
dev)
 =09=09mult =3D (reg * 1000) + reg_f;
 =09=09div =3D 1000;
 =09}
-=09clk_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_mul", dev_name(=
&pdev->dev));
+=09clk_name =3D devm_kasprintf(dev, GFP_KERNEL, "%s_mul", dev_name(dev));
 =09if (!clk_name)
 =09=09return -ENOMEM;
 =09clk_wzrd->clks_internal[wzrd_clk_mul] =3D clk_hw_register_fixed_factor
-=09=09=09(&pdev->dev, clk_name,
+=09=09=09(dev, clk_name,
 =09=09=09 __clk_get_name(clk_wzrd->clk_in1),
 =09=09=090, mult, div);
 =09if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul])) {
-=09=09dev_err(&pdev->dev, "unable to register fixed-factor clock\n");
+=09=09dev_err(dev, "unable to register fixed-factor clock\n");
 =09=09return PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul]);
 =09}
=20
-=09clk_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_mul_div", dev_n=
ame(&pdev->dev));
+=09clk_name =3D devm_kasprintf(dev, GFP_KERNEL, "%s_mul_div", dev_name(dev=
));
 =09if (!clk_name)
 =09=09return -ENOMEM;
=20
@@ -1112,31 +1066,29 @@ static int clk_wzrd_probe(struct platform_device *p=
dev)
=20
 =09=09clk_mul_name =3D clk_hw_get_name(clk_wzrd->clks_internal[wzrd_clk_mu=
l]);
 =09=09clk_wzrd->clks_internal[wzrd_clk_mul_div] =3D
-=09=09=09clk_hw_register_fixed_factor(&pdev->dev, clk_name,
-=09=09=09=09=09=09     clk_mul_name, 0, 1, div);
+=09=09=09clk_hw_register_fixed_factor(dev, clk_name, clk_mul_name, 0, 1, d=
iv);
 =09} else {
 =09=09ctrl_reg =3D clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 0);
 =09=09clk_wzrd->clks_internal[wzrd_clk_mul_div] =3D clk_hw_register_divide=
r
-=09=09=09(&pdev->dev, clk_name,
+=09=09=09(dev, clk_name,
 =09=09=09 clk_hw_get_name(clk_wzrd->clks_internal[wzrd_clk_mul]),
 =09=09=09flags, ctrl_reg, 0, 8, CLK_DIVIDER_ONE_BASED |
 =09=09=09CLK_DIVIDER_ALLOW_ZERO, &clkwzrd_lock);
 =09}
 =09if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div])) {
-=09=09dev_err(&pdev->dev, "unable to register divider clock\n");
+=09=09dev_err(dev, "unable to register divider clock\n");
 =09=09return PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div]);
 =09}
=20
 =09/* register div per output */
 =09for (i =3D nr_outputs - 1; i >=3D 0 ; i--) {
-=09=09clkout_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
-=09=09=09=09=09     "%s_out%d", dev_name(&pdev->dev), i);
+=09=09clkout_name =3D devm_kasprintf(dev, GFP_KERNEL, "%s_out%d", dev_name=
(dev), i);
 =09=09if (!clkout_name)
 =09=09=09return -ENOMEM;
=20
 =09=09if (is_versal) {
 =09=09=09clk_wzrd->clk_data->hws[i] =3D clk_wzrd_ver_register_divider
-=09=09=09=09=09=09(&pdev->dev,
+=09=09=09=09=09=09(dev,
 =09=09=09=09=09=09 clkout_name, clk_name, 0,
 =09=09=09=09=09=09 clk_wzrd->base,
 =09=09=09=09=09=09 (WZRD_CLK_CFG_REG(is_versal, 3) + i * 8),
@@ -1148,7 +1100,7 @@ static int clk_wzrd_probe(struct platform_device *pde=
v)
 =09=09} else {
 =09=09=09if (!i)
 =09=09=09=09clk_wzrd->clk_data->hws[i] =3D clk_wzrd_register_divf
-=09=09=09=09=09(&pdev->dev, clkout_name, clk_name, flags, clk_wzrd->base,
+=09=09=09=09=09(dev, clkout_name, clk_name, flags, clk_wzrd->base,
 =09=09=09=09=09(WZRD_CLK_CFG_REG(is_versal, 2) + i * 12),
 =09=09=09=09=09WZRD_CLKOUT_DIVIDE_SHIFT,
 =09=09=09=09=09WZRD_CLKOUT_DIVIDE_WIDTH,
@@ -1156,7 +1108,7 @@ static int clk_wzrd_probe(struct platform_device *pde=
v)
 =09=09=09=09=09DIV_O, &clkwzrd_lock);
 =09=09=09else
 =09=09=09=09clk_wzrd->clk_data->hws[i] =3D clk_wzrd_register_divider
-=09=09=09=09=09(&pdev->dev, clkout_name, clk_name, 0, clk_wzrd->base,
+=09=09=09=09=09(dev, clkout_name, clk_name, 0, clk_wzrd->base,
 =09=09=09=09=09(WZRD_CLK_CFG_REG(is_versal, 2) + i * 12),
 =09=09=09=09=09WZRD_CLKOUT_DIVIDE_SHIFT,
 =09=09=09=09=09WZRD_CLKOUT_DIVIDE_WIDTH,
@@ -1164,13 +1116,68 @@ static int clk_wzrd_probe(struct platform_device *p=
dev)
 =09=09=09=09=09DIV_O, &clkwzrd_lock);
 =09=09}
 =09=09if (IS_ERR(clk_wzrd->clk_data->hws[i])) {
-=09=09=09dev_err(&pdev->dev,
-=09=09=09=09"unable to register divider clock\n");
+=09=09=09dev_err(dev, "unable to register divider clock\n");
 =09=09=09return PTR_ERR(clk_wzrd->clk_data->hws[i]);
 =09=09}
 =09}
=20
-out:
+=09return 0;
+}
+
+static int clk_wzrd_probe(struct platform_device *pdev)
+{
+=09struct device_node *np =3D pdev->dev.of_node;
+=09struct clk_wzrd *clk_wzrd;
+=09unsigned long rate;
+=09int nr_outputs;
+=09int ret;
+
+=09clk_wzrd =3D devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
+=09if (!clk_wzrd)
+=09=09return -ENOMEM;
+=09platform_set_drvdata(pdev, clk_wzrd);
+
+=09clk_wzrd->base =3D devm_platform_ioremap_resource(pdev, 0);
+=09if (IS_ERR(clk_wzrd->base))
+=09=09return PTR_ERR(clk_wzrd->base);
+
+=09ret =3D of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_g=
rade);
+=09if (!ret) {
+=09=09if (clk_wzrd->speed_grade < 1 || clk_wzrd->speed_grade > 3) {
+=09=09=09dev_warn(&pdev->dev, "invalid speed grade '%d'\n",
+=09=09=09=09 clk_wzrd->speed_grade);
+=09=09=09clk_wzrd->speed_grade =3D 0;
+=09=09}
+=09}
+
+=09clk_wzrd->clk_in1 =3D devm_clk_get(&pdev->dev, "clk_in1");
+=09if (IS_ERR(clk_wzrd->clk_in1))
+=09=09return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
+=09=09=09=09     "clk_in1 not found\n");
+
+=09clk_wzrd->axi_clk =3D devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
+=09if (IS_ERR(clk_wzrd->axi_clk))
+=09=09return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
+=09=09=09=09     "s_axi_aclk not found\n");
+=09rate =3D clk_get_rate(clk_wzrd->axi_clk);
+=09if (rate > WZRD_ACLK_MAX_FREQ) {
+=09=09dev_err(&pdev->dev, "s_axi_aclk frequency (%lu) too high\n", rate);
+=09=09return -EINVAL;
+=09}
+
+=09ret =3D of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
+=09if (ret || nr_outputs > WZRD_NUM_OUTPUTS)
+=09=09return -EINVAL;
+
+=09clk_wzrd->clk_data =3D devm_kzalloc(&pdev->dev, struct_size(clk_wzrd->c=
lk_data, hws,
+=09=09=09=09=09  nr_outputs), GFP_KERNEL);
+=09if (!clk_wzrd->clk_data)
+=09=09return -ENOMEM;
+
+=09ret =3D clk_wzrd_register_output_clocks(&pdev->dev, nr_outputs);
+=09if (ret)
+=09=09return ret;
+
 =09clk_wzrd->clk_data->num =3D nr_outputs;
 =09ret =3D devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get, =
clk_wzrd->clk_data);
 =09if (ret) {
--=20
2.45.2



