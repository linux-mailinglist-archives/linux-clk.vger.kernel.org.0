Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA2A22DE88
	for <lists+linux-clk@lfdr.de>; Sun, 26 Jul 2020 13:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgGZL3Y (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 26 Jul 2020 07:29:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:51428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgGZL3Y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 26 Jul 2020 07:29:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 925DF2065C;
        Sun, 26 Jul 2020 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595762963;
        bh=FcISULcENrwx81QjXOIpqrFYOUXkcvOucAljXmeWIS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X6KrjTtfF97R1vgiPP4OiEPSOm3pdv31vtTZ4ZAAjhUVaN6E1x28gYob73/CuL5HA
         lEKf31CFiDDqmP/DwNe6J8+f2DYdIUrKeV+DR2VWJn4CUrBvRf8AemBPkwwOxw4UTe
         lGPGXcx/2WFoxRiD9jKW298Yn42alfHdz9oY2+BQ=
Date:   Sun, 26 Jul 2020 13:29:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     martin.botka1@gmail.com, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 9/9] soc/qcom: Add REVID driver
Message-ID: <20200726112920.GA1286220@kroah.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-10-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726111215.22361-10-konradybcio@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jul 26, 2020 at 01:12:06PM +0200, Konrad Dybcio wrote:
> From: Xiaozhe Shi <xiaozhes@codeaurora.org>
> 
> Add the REVID device driver. The REVID driver will print out the PMIC
> revision at probe time.

Why do we need this noise in the kernel log?

> --- /dev/null
> +++ b/drivers/soc/qcom/qpnp-revid.c
> @@ -0,0 +1,288 @@
> +/* Copyright (c) 2013-2019, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */

You can drop the GPL boilerplate text and add a proper SPDX line at the
top.

Didn't checkpatch ask for that?

> +
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/spmi.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/err.h>
> +#include <linux/qpnp/qpnp-revid.h>
> +#include <linux/of.h>
> +
> +#define REVID_REVISION1	0x0
> +#define REVID_REVISION2	0x1
> +#define REVID_REVISION3	0x2
> +#define REVID_REVISION4	0x3
> +#define REVID_TYPE	0x4
> +#define REVID_SUBTYPE	0x5
> +#define REVID_STATUS1	0x8
> +#define REVID_SPARE_0	0x60
> +#define REVID_TP_REV	0xf1
> +#define REVID_FAB_ID	0xf2
> +
> +#define QPNP_REVID_DEV_NAME "qcom,qpnp-revid"
> +
> +static const char *const pmic_names[] = {
> +	[0] =	"Unknown PMIC",
> +	[PM8941_SUBTYPE] = "PM8941",
> +	[PM8841_SUBTYPE] = "PM8841",
> +	[PM8019_SUBTYPE] = "PM8019",
> +	[PM8226_SUBTYPE] = "PM8226",
> +	[PM8110_SUBTYPE] = "PM8110",
> +	[PMA8084_SUBTYPE] = "PMA8084",
> +	[PMI8962_SUBTYPE] = "PMI8962",
> +	[PMD9635_SUBTYPE] = "PMD9635",
> +	[PM8994_SUBTYPE] = "PM8994",
> +	[PMI8994_SUBTYPE] = "PMI8994",
> +	[PM8916_SUBTYPE] = "PM8916",
> +	[PM8004_SUBTYPE] = "PM8004",
> +	[PM8909_SUBTYPE] = "PM8909",
> +	[PM2433_SUBTYPE] = "PM2433",
> +	[PMD9655_SUBTYPE] = "PMD9655",
> +	[PM8950_SUBTYPE] = "PM8950",
> +	[PMI8950_SUBTYPE] = "PMI8950",
> +	[PMK8001_SUBTYPE] = "PMK8001",
> +	[PMI8996_SUBTYPE] = "PMI8996",
> +	[PM8998_SUBTYPE] = "PM8998",
> +	[PMI8998_SUBTYPE] = "PMI8998",
> +	[PM8005_SUBTYPE] = "PM8005",
> +	[PM8937_SUBTYPE] = "PM8937",
> +	[PM660L_SUBTYPE] = "PM660L",
> +	[PM660_SUBTYPE] = "PM660",
> +	[PMI632_SUBTYPE] = "PMI632",
> +	[PMI8937_SUBTYPE] = "PMI8937",
> +	[PM8150_SUBTYPE] = "PM8150",
> +	[PM8150B_SUBTYPE] = "PM8150B",
> +	[PM8150L_SUBTYPE] = "PM8150L",
> +	[PM6150_SUBTYPE] = "PM6150",
> +	[PM8150A_SUBTYPE] = "PM8150A",
> +	[PME9205_SUBTYPE] = "PME9205",
> +	[PM6125_SUBTYPE] = "PM6125",
> +	[PM8008_SUBTYPE] = "PM8008",
> +	[SMB1355_SUBTYPE] = "SMB1355",
> +	[SMB1390_SUBTYPE] = "SMB1390",
> +};
> +
> +struct revid_chip {
> +	struct list_head	link;
> +	struct device_node	*dev_node;
> +	struct pmic_revid_data	data;
> +};
> +
> +static LIST_HEAD(revid_chips);
> +static DEFINE_MUTEX(revid_chips_lock);
> +
> +static const struct of_device_id qpnp_revid_match_table[] = {
> +	{ .compatible = QPNP_REVID_DEV_NAME },
> +	{}
> +};
> +
> +static u8 qpnp_read_byte(struct regmap *regmap, u16 addr)
> +{
> +	int rc;
> +	int val;
> +
> +	rc = regmap_read(regmap, addr, &val);
> +	if (rc) {
> +		pr_err("read failed rc=%d\n", rc);

Drivers should always use dev_err() and friends, as you have access to a
struct device * always.  Please fix up the driver here to use that api
instead, no pr_* should be needed at all.

> +		return 0;
> +	}
> +	return (u8)val;
> +}
> +
> +/**
> + * get_revid_data - Return the revision information of PMIC
> + * @dev_node: Pointer to the revid peripheral of the PMIC for which
> + *		revision information is seeked
> + *
> + * CONTEXT: Should be called in non atomic context
> + *
> + * RETURNS: pointer to struct pmic_revid_data filled with the information
> + *		about the PMIC revision
> + */
> +struct pmic_revid_data *get_revid_data(struct device_node *dev_node)
> +{
> +	struct revid_chip *revid_chip;
> +
> +	if (!dev_node)
> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(&revid_chips_lock);
> +	list_for_each_entry(revid_chip, &revid_chips, link) {
> +		if (dev_node == revid_chip->dev_node) {
> +			mutex_unlock(&revid_chips_lock);
> +			return &revid_chip->data;
> +		}
> +	}
> +	mutex_unlock(&revid_chips_lock);
> +	return ERR_PTR(-EINVAL);
> +}
> +EXPORT_SYMBOL(get_revid_data);

Horrible global symbol name.  Who calls this?  This is the last patch in
the series, so if there is no user for this, please don't export it.

> +
> +#define PM8941_PERIPHERAL_SUBTYPE	0x01
> +#define PM8226_PERIPHERAL_SUBTYPE	0x04
> +#define PMD9655_PERIPHERAL_SUBTYPE	0x0F
> +#define PMI8950_PERIPHERAL_SUBTYPE	0x11
> +#define PMI8937_PERIPHERAL_SUBTYPE	0x37
> +static size_t build_pmic_string(char *buf, size_t n, int sid,
> +		u8 subtype, u8 rev1, u8 rev2, u8 rev3, u8 rev4)
> +{
> +	size_t pos = 0;
> +	/*
> +	 * In early versions of PM8941 and PM8226, the major revision number
> +	 * started incrementing from 0 (eg 0 = v1.0, 1 = v2.0).
> +	 * Increment the major revision number here if the chip is an early
> +	 * version of PM8941 or PM8226.
> +	 */
> +	if (((int)subtype == PM8941_PERIPHERAL_SUBTYPE
> +			|| (int)subtype == PM8226_PERIPHERAL_SUBTYPE)
> +			&& rev4 < 0x02)
> +		rev4++;
> +
> +	pos += snprintf(buf + pos, n - pos, "PMIC@SID%d", sid);
> +	if (subtype >= ARRAY_SIZE(pmic_names) || subtype == 0)
> +		pos += snprintf(buf + pos, n - pos, ": %s (subtype: 0x%02X)",
> +				pmic_names[0], subtype);
> +	else
> +		pos += snprintf(buf + pos, n - pos, ": %s",
> +				pmic_names[subtype]);
> +	pos += snprintf(buf + pos, n - pos, " v%d.%d", rev4, rev3);
> +	if (rev2 || rev1)
> +		pos += snprintf(buf + pos, n - pos, ".%d", rev2);
> +	if (rev1)
> +		pos += snprintf(buf + pos, n - pos, ".%d", rev1);
> +	return pos;
> +}
> +
> +#define PMIC_PERIPHERAL_TYPE		0x51
> +#define PMIC_STRING_MAXLENGTH		80
> +static int qpnp_revid_probe(struct platform_device *pdev)
> +{
> +	u8 rev1, rev2, rev3, rev4, pmic_type, pmic_subtype, pmic_status;
> +	u8 option1, option2, option3, option4, spare0;
> +	unsigned int base;
> +	int rc, fab_id, tp_rev;
> +	char pmic_string[PMIC_STRING_MAXLENGTH] = {'\0'};
> +	struct revid_chip *revid_chip;
> +	struct regmap *regmap;
> +
> +	regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!regmap) {
> +		dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
> +		return -EINVAL;
> +	}
> +
> +	rc = of_property_read_u32(pdev->dev.of_node, "reg", &base);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev,
> +			"Couldn't find reg in node = %s rc = %d\n",
> +			pdev->dev.of_node->full_name, rc);
> +		return rc;
> +	}
> +	pmic_type = qpnp_read_byte(regmap, base + REVID_TYPE);
> +	if (pmic_type != PMIC_PERIPHERAL_TYPE) {
> +		pr_err("Invalid REVID peripheral type: %02X\n", pmic_type);
> +		return -EINVAL;
> +	}
> +
> +	rev1 = qpnp_read_byte(regmap, base + REVID_REVISION1);
> +	rev2 = qpnp_read_byte(regmap, base + REVID_REVISION2);
> +	rev3 = qpnp_read_byte(regmap, base + REVID_REVISION3);
> +	rev4 = qpnp_read_byte(regmap, base + REVID_REVISION4);
> +
> +	pmic_subtype = qpnp_read_byte(regmap, base + REVID_SUBTYPE);
> +	if (pmic_subtype != PMD9655_PERIPHERAL_SUBTYPE)
> +		pmic_status = qpnp_read_byte(regmap, base + REVID_STATUS1);
> +	else
> +		pmic_status = 0;
> +
> +	/* special case for PMI8937 */
> +	if (pmic_subtype == PMI8950_PERIPHERAL_SUBTYPE) {
> +		/* read spare register */
> +		spare0 = qpnp_read_byte(regmap, base + REVID_SPARE_0);
> +		if (spare0)
> +			pmic_subtype = PMI8937_PERIPHERAL_SUBTYPE;
> +	}
> +
> +	if (of_property_read_bool(pdev->dev.of_node, "qcom,fab-id-valid"))
> +		fab_id = qpnp_read_byte(regmap, base + REVID_FAB_ID);
> +	else
> +		fab_id = -EINVAL;
> +
> +	if (of_property_read_bool(pdev->dev.of_node, "qcom,tp-rev-valid"))
> +		tp_rev = qpnp_read_byte(regmap, base + REVID_TP_REV);
> +	else
> +		tp_rev = -EINVAL;
> +
> +	revid_chip = devm_kzalloc(&pdev->dev, sizeof(struct revid_chip),
> +						GFP_KERNEL);
> +	if (!revid_chip)
> +		return -ENOMEM;
> +
> +	revid_chip->dev_node = pdev->dev.of_node;
> +	revid_chip->data.rev1 = rev1;
> +	revid_chip->data.rev2 = rev2;
> +	revid_chip->data.rev3 = rev3;
> +	revid_chip->data.rev4 = rev4;
> +	revid_chip->data.pmic_subtype = pmic_subtype;
> +	revid_chip->data.pmic_type = pmic_type;
> +	revid_chip->data.fab_id = fab_id;
> +	revid_chip->data.tp_rev = tp_rev;
> +
> +	if (pmic_subtype < ARRAY_SIZE(pmic_names))
> +		revid_chip->data.pmic_name = pmic_names[pmic_subtype];
> +	else
> +		revid_chip->data.pmic_name = pmic_names[0];
> +
> +	mutex_lock(&revid_chips_lock);
> +	list_add(&revid_chip->link, &revid_chips);
> +	mutex_unlock(&revid_chips_lock);
> +
> +	option1 = pmic_status & 0x3;
> +	option2 = (pmic_status >> 2) & 0x3;
> +	option3 = (pmic_status >> 4) & 0x3;
> +	option4 = (pmic_status >> 6) & 0x3;
> +
> +	build_pmic_string(pmic_string, PMIC_STRING_MAXLENGTH,
> +			  to_spmi_device(pdev->dev.parent)->usid,
> +			pmic_subtype, rev1, rev2, rev3, rev4);
> +	pr_info("%s options: %d, %d, %d, %d\n",
> +			pmic_string, option1, option2, option3, option4);

Again, dev_info().

But really, why?  Who uses this information?  Drivers should be quiet if
all is working properly, no need to log anything.

> +	return 0;
> +}
> +
> +static struct platform_driver qpnp_revid_driver = {
> +	.probe	= qpnp_revid_probe,
> +	.driver	= {
> +		.name		= QPNP_REVID_DEV_NAME,
> +		.owner		= THIS_MODULE,
> +		.of_match_table	= qpnp_revid_match_table,
> +	},
> +};
> +
> +static int __init qpnp_revid_init(void)
> +{
> +	return platform_driver_register(&qpnp_revid_driver);
> +}
> +
> +static void __exit qpnp_revid_exit(void)
> +{
> +	return platform_driver_unregister(&qpnp_revid_driver);
> +}
> +
> +subsys_initcall(qpnp_revid_init);

Why subsys_initcall() if no one uses the function in this module?

Can't you just use the "normal" platform module init macros?

> +module_exit(qpnp_revid_exit);
> +
> +MODULE_DESCRIPTION("QPNP REVID DRIVER");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" QPNP_REVID_DEV_NAME);
> diff --git a/include/linux/qpnp/qpnp-revid.h b/include/linux/qpnp/qpnp-revid.h
> new file mode 100644
> index 000000000000..0fbdd528d204
> --- /dev/null
> +++ b/include/linux/qpnp/qpnp-revid.h

Why do you need a .h file in the include directory if only a single .c
file needs it?  Just put that info in the .c file itself.


> @@ -0,0 +1,369 @@
> +/* Copyright (c) 2013-2019, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __QPNP_REVID
> +#define __QPNP_REVID
> +
> +/* Common TYPE for all PMICs */
> +#define PMIC_TYPE		0x51
> +
> +/* PM8994 */
> +#define PM8941_SUBTYPE		0x01
> +
> +#define PM8941_V1P0_REV1	0x00
> +#define PM8941_V1P0_REV2	0x00
> +#define PM8941_V1P0_REV3	0x00
> +#define PM8941_V1P0_REV4	0x01
> +
> +#define PM8941_V2P0_REV1	0x00
> +#define PM8941_V2P0_REV2	0x00
> +#define PM8941_V2P0_REV3	0x00
> +#define PM8941_V2P0_REV4	0x01
> +
> +#define PM8941_V3P0_REV1	0x00
> +#define PM8941_V3P0_REV2	0x00
> +#define PM8941_V3P0_REV3	0x00
> +#define PM8941_V3P0_REV4	0x03
> +
> +#define PM8941_V3P1_REV1	0x00
> +#define PM8941_V3P1_REV2	0x00
> +#define PM8941_V3P1_REV3	0x01
> +#define PM8941_V3P1_REV4	0x03
> +
> +/* PM8841 */
> +#define PM8841_SUBTYPE		0x02
> +
> +/* PM8019 */
> +#define PM8019_SUBTYPE		0x03
> +
> +/* PM8226 */
> +#define PM8226_SUBTYPE		0x04
> +
> +#define PM8226_V2P2_REV1	0x00
> +#define PM8226_V2P2_REV2	0x00
> +#define PM8226_V2P2_REV3	0x02
> +#define PM8226_V2P2_REV4	0x02
> +
> +#define PM8226_V2P1_REV1	0x00
> +#define PM8226_V2P1_REV2	0x00
> +#define PM8226_V2P1_REV3	0x01
> +#define PM8226_V2P1_REV4	0x02
> +
> +#define PM8226_V2P0_REV1	0x00
> +#define PM8226_V2P0_REV2	0x00
> +#define PM8226_V2P0_REV3	0x00
> +#define PM8226_V2P0_REV4	0x02
> +
> +#define PM8226_V1P0_REV1	0x00
> +#define PM8226_V1P0_REV2	0x00
> +#define PM8226_V1P0_REV3	0x00
> +#define PM8226_V1P0_REV4	0x00
> +
> +/* PM8110 */
> +#define PM8110_SUBTYPE		0x05
> +
> +#define PM8110_V1P0_REV1	0x00
> +#define PM8110_V1P0_REV2	0x00
> +#define PM8110_V1P0_REV3	0x00
> +#define PM8110_V1P0_REV4	0x01
> +
> +#define PM8110_V1P1_REV1	0x00
> +#define PM8110_V1P1_REV2	0x01
> +#define PM8110_V1P1_REV3	0x00
> +#define PM8110_V1P1_REV4	0x01
> +
> +#define PM8110_V1P3_REV1	0x00
> +#define PM8110_V1P3_REV2	0x03
> +#define PM8110_V1P3_REV3	0x00
> +#define PM8110_V1P3_REV4	0x01
> +
> +#define PM8110_V2P0_REV1	0x00
> +#define PM8110_V2P0_REV2	0x00
> +#define PM8110_V2P0_REV3	0x00
> +#define PM8110_V2P0_REV4	0x02
> +
> +/* PMA8084 */
> +#define PMA8084_SUBTYPE		0x06
> +
> +/* PMI8962 */
> +#define PMI8962_SUBTYPE		0x07
> +
> +/* PMD9635 */
> +#define PMD9635_SUBTYPE		0x08
> +/* PM8994 */
> +#define PM8994_SUBTYPE		0x09
> +
> +/* PMI8994 */
> +#define PMI8994_TYPE		0x51
> +#define PMI8994_SUBTYPE		0x0A
> +
> +#define PMI8994_V1P0_REV1	0x00
> +#define PMI8994_V1P0_REV2	0x00
> +#define PMI8994_V1P0_REV3	0x00
> +#define PMI8994_V1P0_REV4	0x01
> +
> +#define PMI8994_V2P0_REV1	0x00
> +#define PMI8994_V2P0_REV2	0x00
> +#define PMI8994_V2P0_REV3	0x00
> +#define PMI8994_V2P0_REV4	0x02
> +
> +/* PM8916 */
> +#define PM8916_SUBTYPE		0x0B
> +
> +#define PM8916_V1P0_REV1	0x00
> +#define PM8916_V1P0_REV2	0x00
> +#define PM8916_V1P0_REV3	0x00
> +#define PM8916_V1P0_REV4	0x01
> +
> +#define PM8916_V1P1_REV1	0x00
> +#define PM8916_V1P1_REV2	0x00
> +#define PM8916_V1P1_REV3	0x01
> +#define PM8916_V1P1_REV4	0x01
> +
> +#define PM8916_V2P0_REV1	0x00
> +#define PM8916_V2P0_REV2	0x00
> +#define PM8916_V2P0_REV3	0x00
> +#define PM8916_V2P0_REV4	0x02
> +
> +/* PM8004 */
> +#define PM8004_SUBTYPE		0x0C
> +
> +/* PM8909 */
> +#define PM8909_SUBTYPE		0x0D
> +
> +#define PM8909_V1P0_REV1	0x00
> +#define PM8909_V1P0_REV2	0x00
> +#define PM8909_V1P0_REV3	0x00
> +#define PM8909_V1P0_REV4	0x01
> +
> +#define PM8909_V1P1_REV1	0x00
> +#define PM8909_V1P1_REV2	0x00
> +#define PM8909_V1P1_REV3	0x01
> +#define PM8909_V1P1_REV4	0x01
> +
> +/* PM2433 */
> +#define PM2433_SUBTYPE		0x0E
> +
> +/* PMD9655 */
> +#define PMD9655_SUBTYPE		0x0F
> +
> +/* PM8950 */
> +#define PM8950_SUBTYPE		0x10
> +#define PM8950_V1P0_REV4	0x01
> +
> +#define PM8950_V2P0_REV4	0x02
> +
> +/* PMI8950 */
> +#define PMI8950_SUBTYPE		0x11
> +
> +/* PMK8001 */
> +#define PMK8001_SUBTYPE		0x12
> +
> +/* PMI8996 */
> +#define PMI8996_SUBTYPE		0x13
> +
> +/* PM8998 */
> +#define PM8998_SUBTYPE	0x14
> +
> +/* PMI8998 */
> +#define PMI8998_SUBTYPE	0x15
> +
> +/* PM660 */
> +#define PM660L_SUBTYPE	0x1A
> +#define PM660_SUBTYPE	0x1B
> +
> +/* PM8150 */
> +#define PM8150_SUBTYPE		0x1E
> +#define PM8150L_SUBTYPE		0x1F
> +#define PM8150B_SUBTYPE		0x20
> +#define PM8150A_SUBTYPE		0x27
> +
> +/* PM6150 SUBTYPE */
> +#define PM6150_SUBTYPE		0x28
> +#define PM6150L_SUBTYPE		0x1F
> +
> +/* PME9205 SUBTYPE */
> +#define PME9205_SUBTYPE		0x24
> +
> +/* PM6125 SUBTYPE */
> +#define PM6125_SUBTYPE		0x2D
> +
> +/* PMI632 */
> +#define PMI632_SUBTYPE	0x25
> +
> +/* PM8008 SUBTYPE */
> +#define PM8008_SUBTYPE	0x2C
> +
> +/* PMI8998 REV_ID */
> +#define PMI8998_V1P0_REV1	0x00
> +#define PMI8998_V1P0_REV2	0x00
> +#define PMI8998_V1P0_REV3	0x00
> +#define PMI8998_V1P0_REV4	0x01
> +
> +#define PMI8998_V1P1_REV1	0x00
> +#define PMI8998_V1P1_REV2	0x00
> +#define PMI8998_V1P1_REV3	0x01
> +#define PMI8998_V1P1_REV4	0x01
> +
> +#define PMI8998_V2P0_REV1	0x00
> +#define PMI8998_V2P0_REV2	0x00
> +#define PMI8998_V2P0_REV3	0x00
> +#define PMI8998_V2P0_REV4	0x02
> +
> +/* PM660 REV_ID */
> +#define PM660_V1P0_REV1		0x00
> +#define PM660_V1P0_REV2		0x00
> +#define PM660_V1P0_REV3		0x00
> +#define PM660_V1P0_REV4		0x01
> +
> +#define PM660_V1P1_REV1		0x00
> +#define PM660_V1P1_REV2		0x00
> +#define PM660_V1P1_REV3		0x01
> +#define PM660_V1P1_REV4		0x01
> +
> +/* PM660L REV_ID */
> +#define PM660L_V1P1_REV1	0x00
> +#define PM660L_V1P1_REV2	0x00
> +#define PM660L_V1P1_REV3	0x01
> +#define PM660L_V1P1_REV4	0x01
> +
> +#define PM660L_V2P0_REV1	0x00
> +#define PM660L_V2P0_REV2	0x00
> +#define PM660L_V2P0_REV3	0x00
> +#define PM660L_V2P0_REV4	0x02
> +
> +/* PMI632 REV_ID */
> +#define PMI632_V1P0_REV1	0x00
> +#define PMI632_V1P0_REV2	0x00
> +#define PMI632_V1P0_REV3	0x00
> +#define PMI632_V1P0_REV4	0x01
> +
> +/* PM8150B_REV_ID */
> +#define PM8150B_V1P0_REV1	0x00
> +#define PM8150B_V1P0_REV2	0x00
> +#define PM8150B_V1P0_REV3	0x00
> +#define PM8150B_V1P0_REV4	0x01
> +
> +#define PM8150B_V2P0_REV1	0x00
> +#define PM8150B_V2P0_REV2	0x00
> +#define PM8150B_V2P0_REV3	0x00
> +#define PM8150B_V2P0_REV4	0x02
> +
> +/* PM8150L_REV_ID */
> +#define PM8150L_V1P0_REV1	0x00
> +#define PM8150L_V1P0_REV2	0x00
> +#define PM8150L_V1P0_REV3	0x00
> +#define PM8150L_V1P0_REV4	0x01
> +
> +#define PM8150L_V2P0_REV1	0x00
> +#define PM8150L_V2P0_REV2	0x00
> +#define PM8150L_V2P0_REV3	0x00
> +#define PM8150L_V2P0_REV4	0x02
> +
> +#define PM8150L_V3P0_REV1	0x00
> +#define PM8150L_V3P0_REV2	0x00
> +#define PM8150L_V3P0_REV3	0x00
> +#define PM8150L_V3P0_REV4	0x03
> +
> +/* PM8150A_REV_ID */
> +#define PM8150A_V1P0_REV1	0x00
> +#define PM8150A_V1P0_REV2	0x00
> +#define PM8150A_V1P0_REV3	0x00
> +#define PM8150A_V1P0_REV4	0x01
> +
> +#define PM8150A_V2P0_REV1	0x00
> +#define PM8150A_V2P0_REV2	0x00
> +#define PM8150A_V2P0_REV3	0x00
> +#define PM8150A_V2P0_REV4	0x02
> +
> +/* PME9205_REV_ID */
> +#define PME9205_V1P0_REV1	0x00
> +#define PME9205_V1P0_REV2	0x00
> +#define PME9205_V1P0_REV3	0x00
> +#define PME9205_V1P0_REV4	0x01
> +
> +#define PME9205_V2P0_REV1	0x00
> +#define PME9205_V2P0_REV2	0x00
> +#define PME9205_V2P0_REV3	0x00
> +#define PME9205_V2P0_REV4	0x02
> +
> +/* PM6150_REV_ID */
> +#define PM6150_V1P0_REV1	0x00
> +#define PM6150_V1P0_REV2	0x00
> +#define PM6150_V1P0_REV3	0x00
> +#define PM6150_V1P0_REV4	0x01
> +
> +#define PM6150_V1P1_REV1	0x00
> +#define PM6150_V1P1_REV2	0x00
> +#define PM6150_V1P1_REV3	0x01
> +#define PM6150_V1P1_REV4	0x01
> +
> +#define PM6150_V2P0_REV1	0x00
> +#define PM6150_V2P0_REV2	0x00
> +#define PM6150_V2P0_REV3	0x00
> +#define PM6150_V2P0_REV4	0x02
> +
> +/* PM6125_REV_ID */
> +#define PM6125_V1P0_REV1	0x00
> +#define PM6125_V1P0_REV2	0x00
> +#define PM6125_V1P0_REV3	0x00
> +#define PM6125_V1P0_REV4	0x01
> +
> +/* PMI8998 FAB_ID */
> +#define PMI8998_FAB_ID_SMIC	0x11
> +#define PMI8998_FAB_ID_GF	0x30
> +
> +/* PM660 FAB_ID */
> +#define PM660_FAB_ID_GF		0x0
> +#define PM660_FAB_ID_TSMC	0x2
> +#define PM660_FAB_ID_MX		0x3
> +
> +/* PM8005 */
> +#define PM8005_SUBTYPE		0x18
> +
> +/* PM8937 */
> +#define PM8937_SUBTYPE		0x19
> +
> +/* PMI8937 */
> +#define PMI8937_SUBTYPE		0x37
> +
> +/* SMB1390 */
> +#define SMB1390_SUBTYPE		0x23
> +
> +/* SMB1381 */
> +#define SMB1381_SUBTYPE		0x17
> +
> +/* SMB1355 */
> +#define SMB1355_SUBTYPE		0x1C
> +
> +struct pmic_revid_data {
> +	u8		rev1;
> +	u8		rev2;
> +	u8		rev3;
> +	u8		rev4;
> +	u8		pmic_type;
> +	u8		pmic_subtype;
> +	const char	*pmic_name;
> +	int		fab_id;
> +	int		tp_rev;

int and not u32 or u64?

But again, who uses this module?  If it's only good for a single line in
the kernel log, that feels like a huge waste to me.

thanks,

greg k-h
