Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAB145EC94
	for <lists+linux-clk@lfdr.de>; Fri, 26 Nov 2021 12:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238967AbhKZL1z (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 26 Nov 2021 06:27:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21377 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239006AbhKZLZy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Nov 2021 06:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637925761;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5wQ71Ekph3DRe2BFAcFX0uixh6OWYjGAxQ/auMSN/pI=;
        b=eeDz1ey/szK1NQmn2gl5nNFOWEtsmhGCU/gNkAmQtPFDExOndi+0cIKVMTswur3VDkxQeS
        qAHolSzasVksYE5hXPzM1wFDZHK3e55h5MY0W/QJXBlmgivOIXmRenoetHqLnUPvWrZka2
        LL8OprXr7qwx+yan45nPTEN16lIqNcw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-G1lt6i-YO6eUfi2YrPQ9Dw-1; Fri, 26 Nov 2021 06:22:38 -0500
X-MC-Unique: G1lt6i-YO6eUfi2YrPQ9Dw-1
Received: by mail-ed1-f69.google.com with SMTP id b15-20020aa7c6cf000000b003e7cf0f73daso7725853eds.22
        for <linux-clk@vger.kernel.org>; Fri, 26 Nov 2021 03:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5wQ71Ekph3DRe2BFAcFX0uixh6OWYjGAxQ/auMSN/pI=;
        b=SDHlG0S9i6IGlZ1L+LlNNktrzj4uaW5P1wRIppWtG2BWtLGB8GhmkfRUmOWimoTB9F
         m/WfG575sow/xaIsLIwitXZSHd9ZmXm07GYeDmF2AffP42IucA+c6elfrUS/w4ibKq8i
         AbiS8OSQvQS3gako+qz5CemwyjwPevngPYtDPOwvrmX2R+DUakgR/t5YHFMRqBfEXu1z
         IvAEcA5YqEFzWxg+NqVG6R+QNbkcqPlCp4+cKCPBzzlHHeCQvAThTGzLnD4IvjRTOsoe
         RvLg4KmlfEdjn9DDbEVwTFpGgR9ycPM/vP2hTmWv2iRoIKI/pE+RvRuQP8odlT7uPG3s
         EGpA==
X-Gm-Message-State: AOAM532pbzB9jPp/WjrLgq3Gm5OlQgUzIj8rJ4l5MSLGnWxYhG/a60wL
        IDg0KhPG7A+KaIZdCcI5GHxYC2zO57hwboL5Jq9yakgX8/R7C8m0Mx5/45HfgPm07ymgsSI4q0m
        /KkRpme1HDFNXcWbBqzk3
X-Received: by 2002:a17:906:fcbb:: with SMTP id qw27mr37500938ejb.320.1637925756925;
        Fri, 26 Nov 2021 03:22:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPOFL2cQbmr2W2mt4cULzTQZVhO7d08bazuCPqd8d7L4mLsxhcBClNOG0Ss2AXat+dwi95iw==
X-Received: by 2002:a17:906:fcbb:: with SMTP id qw27mr37500907ejb.320.1637925756666;
        Fri, 26 Nov 2021 03:22:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y19sm642739edq.2.2021.11.26.03.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 03:22:36 -0800 (PST)
Message-ID: <19aeff06-d397-5f88-6d07-f76a2073b682@redhat.com>
Date:   Fri, 26 Nov 2021 12:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 05/15] regulator: Introduce tps68470-regulator driver
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20211125165412.535063-1-hdegoede@redhat.com>
 <20211125165412.535063-6-hdegoede@redhat.com>
 <YaAdIG+2MZPsdI+F@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YaAdIG+2MZPsdI+F@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Laurent,

On 11/26/21 00:32, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> I've had a quick look and the driver seems fine. Just a few comments
> below.
> 
> On Thu, Nov 25, 2021 at 05:54:02PM +0100, Hans de Goede wrote:
>> The TPS68470 PMIC provides Clocks, GPIOs and Regulators. At present in
>> the kernel the Regulators and Clocks are controlled by an OpRegion
>> driver designed to work with power control methods defined in ACPI, but
>> some platforms lack those methods, meaning drivers need to be able to
>> consume the resources of these chips through the usual frameworks.
>>
>> This commit adds a driver for the regulators provided by the tps68470,
>> and is designed to bind to the platform_device registered by the
>> intel_skl_int3472 module.
>>
>> This is based on this out of tree driver written by Intel:
>> https://github.com/intel/linux-intel-lts/blob/4.14/base/drivers/regulator/tps68470-regulator.c
>> with various cleanups added.
>>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v6:
>> - Drop the unused volt_table argument from the TPS68470_REGULATOR() macro
>> - While working on VCM (voice coil motor) support for the camera-module behind
>>   this PMIC I learned that the VIO voltage is always on. Instead of pointing its
>>   enable_reg and enable_mask at the same register-bits as the VSIO regulator
>>   (which is wrong), add a new tps68470_always_on_reg_ops struct without
>>   is_enabled, enable and disable ops and use that for the VIO regulator.
>>
>> Changes in v5:
>> - Small comment / code cleanups based on review from Andy
>>
>> Changes in v4:
>> - Make the top comment block use c++ style comments
>> - Drop the bogus builtin regulator_init_data
>> - Add || COMPILE_TEST to Kconfig snippet
>> - Make the driver enable the PMIC clk when enabling the Core buck
>>   regulator, this switching regulator needs the PLL to be on
>>
>> Changes in v2:
>> - Update the comment on why a subsys_initcall is used to register the drv
>> - Make struct regulator_ops const
>> ---
>>  drivers/regulator/Kconfig              |   9 ++
>>  drivers/regulator/Makefile             |   1 +
>>  drivers/regulator/tps68470-regulator.c | 201 +++++++++++++++++++++++++
>>  3 files changed, 211 insertions(+)
>>  create mode 100644 drivers/regulator/tps68470-regulator.c
>>
>> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
>> index 6be9b1c8a615..ebe46e09510e 100644
>> --- a/drivers/regulator/Kconfig
>> +++ b/drivers/regulator/Kconfig
>> @@ -1339,6 +1339,15 @@ config REGULATOR_TPS65912
>>  	help
>>  	    This driver supports TPS65912 voltage regulator chip.
>>  
>> +config REGULATOR_TPS68470
>> +	tristate "TI TPS68470 PMIC Regulators Driver"
>> +	depends on INTEL_SKL_INT3472 || COMPILE_TEST
>> +	help
>> +	  This driver adds support for the TPS68470 PMIC to register
>> +	  regulators against the usual framework.
>> +
>> +	  The module will be called "tps68470-regulator".
>> +
>>  config REGULATOR_TWL4030
>>  	tristate "TI TWL4030/TWL5030/TWL6030/TPS659x0 PMIC"
>>  	depends on TWL4030_CORE
>> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
>> index b07d2a22df0b..257331d2caed 100644
>> --- a/drivers/regulator/Makefile
>> +++ b/drivers/regulator/Makefile
>> @@ -159,6 +159,7 @@ obj-$(CONFIG_REGULATOR_TPS6586X) += tps6586x-regulator.o
>>  obj-$(CONFIG_REGULATOR_TPS65910) += tps65910-regulator.o
>>  obj-$(CONFIG_REGULATOR_TPS65912) += tps65912-regulator.o
>>  obj-$(CONFIG_REGULATOR_TPS65132) += tps65132-regulator.o
>> +obj-$(CONFIG_REGULATOR_TPS68470) += tps68470-regulator.o
>>  obj-$(CONFIG_REGULATOR_TWL4030) += twl-regulator.o twl6030-regulator.o
>>  obj-$(CONFIG_REGULATOR_UNIPHIER) += uniphier-regulator.o
>>  obj-$(CONFIG_REGULATOR_VCTRL) += vctrl-regulator.o
>> diff --git a/drivers/regulator/tps68470-regulator.c b/drivers/regulator/tps68470-regulator.c
>> new file mode 100644
>> index 000000000000..9ad2d1eae8fe
>> --- /dev/null
>> +++ b/drivers/regulator/tps68470-regulator.c
>> @@ -0,0 +1,201 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//
>> +// Regulator driver for TPS68470 PMIC
>> +//
>> +// Copyright (c) 2021 Red Hat Inc.
>> +// Copyright (C) 2018 Intel Corporation
>> +//
>> +// Authors:
>> +//	Hans de Goede <hdegoede@redhat.com>
>> +//	Zaikuo Wang <zaikuo.wang@intel.com>
>> +//	Tianshu Qiu <tian.shu.qiu@intel.com>
>> +//	Jian Xu Zheng <jian.xu.zheng@intel.com>
>> +//	Yuning Pu <yuning.pu@intel.com>
>> +//	Rajmohan Mani <rajmohan.mani@intel.com>
>> +
>> +#include <linux/clk.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/tps68470.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_data/tps68470.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regulator/driver.h>
>> +#include <linux/regulator/machine.h>
>> +
>> +struct tps68470_regulator_data {
>> +	struct clk *clk;
>> +};
>> +
>> +#define TPS68470_REGULATOR(_name, _id, _ops, _n,			\
>> +			   _vr, _vm, _er, _em, _lr, _nlr)		\
>> +	[TPS68470_ ## _name] = {					\
>> +		.name			= # _name,			\
>> +		.id			= _id,				\
>> +		.ops			= &_ops,			\
>> +		.n_voltages		= _n,				\
>> +		.type			= REGULATOR_VOLTAGE,		\
>> +		.owner			= THIS_MODULE,			\
>> +		.vsel_reg		= _vr,				\
>> +		.vsel_mask		= _vm,				\
>> +		.enable_reg		= _er,				\
>> +		.enable_mask		= _em,				\
>> +		.linear_ranges		= _lr,				\
>> +		.n_linear_ranges	= _nlr,				\
>> +	}
>> +
>> +static const struct linear_range tps68470_ldo_ranges[] = {
>> +	REGULATOR_LINEAR_RANGE(875000, 0, 125, 17800),
>> +};
>> +
>> +static const struct linear_range tps68470_core_ranges[] = {
>> +	REGULATOR_LINEAR_RANGE(900000, 0, 42, 25000),
>> +};
>> +
>> +static int tps68470_regulator_enable(struct regulator_dev *rdev)
>> +{
>> +	struct tps68470_regulator_data *data = rdev->reg_data;
>> +	int ret;
>> +
>> +	/* The Core buck regulator needs the PMIC's PLL to be enabled */
>> +	if (rdev->desc->id == TPS68470_CORE) {
>> +		ret = clk_prepare_enable(data->clk);
>> +		if (ret) {
>> +			dev_err(&rdev->dev, "Error enabling TPS68470 clock\n");
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return regulator_enable_regmap(rdev);
>> +}
>> +
>> +static int tps68470_regulator_disable(struct regulator_dev *rdev)
>> +{
>> +	struct tps68470_regulator_data *data = rdev->reg_data;
>> +
>> +	if (rdev->desc->id == TPS68470_CORE)
>> +		clk_disable_unprepare(data->clk);
>> +
>> +	return regulator_disable_regmap(rdev);
>> +}
>> +
>> +/* Operations permitted on DCDCx, LDO2, LDO3 and LDO4 */
>> +static const struct regulator_ops tps68470_regulator_ops = {
>> +	.is_enabled		= regulator_is_enabled_regmap,
>> +	.enable			= tps68470_regulator_enable,
>> +	.disable		= tps68470_regulator_disable,
>> +	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
>> +	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
>> +	.list_voltage		= regulator_list_voltage_linear_range,
>> +	.map_voltage		= regulator_map_voltage_linear_range,
>> +};
>> +
>> +static const struct regulator_ops tps68470_always_on_reg_ops = {
>> +	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
>> +	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
>> +	.list_voltage		= regulator_list_voltage_linear_range,
>> +	.map_voltage		= regulator_map_voltage_linear_range,
>> +};
>> +
>> +static const struct regulator_desc regulators[] = {
>> +	TPS68470_REGULATOR(CORE, TPS68470_CORE, tps68470_regulator_ops, 43,
>> +			   TPS68470_REG_VDVAL, TPS68470_VDVAL_DVOLT_MASK,
>> +			   TPS68470_REG_VDCTL, TPS68470_VDCTL_EN_MASK,
>> +			   tps68470_core_ranges, ARRAY_SIZE(tps68470_core_ranges)),
>> +	TPS68470_REGULATOR(ANA, TPS68470_ANA, tps68470_regulator_ops, 126,
>> +			   TPS68470_REG_VAVAL, TPS68470_VAVAL_AVOLT_MASK,
>> +			   TPS68470_REG_VACTL, TPS68470_VACTL_EN_MASK,
>> +			   tps68470_ldo_ranges, ARRAY_SIZE(tps68470_ldo_ranges)),
>> +	TPS68470_REGULATOR(VCM, TPS68470_VCM, tps68470_regulator_ops, 126,
>> +			   TPS68470_REG_VCMVAL, TPS68470_VCMVAL_VCVOLT_MASK,
>> +			   TPS68470_REG_VCMCTL, TPS68470_VCMCTL_EN_MASK,
>> +			   tps68470_ldo_ranges, ARRAY_SIZE(tps68470_ldo_ranges)),
>> +	TPS68470_REGULATOR(VIO, TPS68470_VIO, tps68470_always_on_reg_ops, 126,
>> +			   TPS68470_REG_VIOVAL, TPS68470_VIOVAL_IOVOLT_MASK,
>> +			   0, 0,
>> +			   tps68470_ldo_ranges, ARRAY_SIZE(tps68470_ldo_ranges)),
>> +/*
>> + * (1) This regulator must have the same voltage as VIO if S_IO LDO is used to
>> + *     power a sensor/VCM which I2C is daisy chained behind the PMIC.
>> + * (2) If there is no I2C daisy chain it can be set freely.
>> + */
> 
> Do we need safety checks for this ?

There really is no way to deal this condition needs to matches inside the driver,
this should be enforced by setting proper constraints on the 2 regulators where
the PMIC is used with a sensor I2C daisy chained behind it.

> 
>> +	TPS68470_REGULATOR(VSIO, TPS68470_VSIO, tps68470_regulator_ops, 126,
>> +			   TPS68470_REG_VSIOVAL, TPS68470_VSIOVAL_IOVOLT_MASK,
>> +			   TPS68470_REG_S_I2C_CTL, TPS68470_S_I2C_CTL_EN_MASK,
>> +			   tps68470_ldo_ranges, ARRAY_SIZE(tps68470_ldo_ranges)),
>> +	TPS68470_REGULATOR(AUX1, TPS68470_AUX1, tps68470_regulator_ops, 126,
>> +			   TPS68470_REG_VAUX1VAL, TPS68470_VAUX1VAL_AUX1VOLT_MASK,
>> +			   TPS68470_REG_VAUX1CTL, TPS68470_VAUX1CTL_EN_MASK,
>> +			   tps68470_ldo_ranges, ARRAY_SIZE(tps68470_ldo_ranges)),
>> +	TPS68470_REGULATOR(AUX2, TPS68470_AUX2, tps68470_regulator_ops, 126,
>> +			   TPS68470_REG_VAUX2VAL, TPS68470_VAUX2VAL_AUX2VOLT_MASK,
>> +			   TPS68470_REG_VAUX2CTL, TPS68470_VAUX2CTL_EN_MASK,
>> +			   tps68470_ldo_ranges, ARRAY_SIZE(tps68470_ldo_ranges)),
>> +};
>> +
>> +static int tps68470_regulator_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct tps68470_regulator_platform_data *pdata = dev_get_platdata(dev);
>> +	struct tps68470_regulator_data *data;
>> +	struct regulator_config config = { };
>> +	struct regulator_dev *rdev;
>> +	int i;
>> +
>> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->clk = devm_clk_get(dev, "tps68470-clk");
>> +	if (IS_ERR(data->clk))
>> +		return dev_err_probe(dev, PTR_ERR(data->clk), "getting tps68470-clk\n");
>> +
>> +	config.dev = dev->parent;
>> +	config.regmap = dev_get_drvdata(dev->parent);
>> +	config.driver_data = data;
>> +
>> +	for (i = 0; i < TPS68470_NUM_REGULATORS; i++) {
>> +		if (pdata)
>> +			config.init_data = pdata->reg_init_data[i];
>> +		else
>> +			config.init_data = NULL;
>> +
>> +		rdev = devm_regulator_register(dev, &regulators[i], &config);
>> +		if (IS_ERR(rdev))
>> +			return dev_err_probe(dev, PTR_ERR(data->clk),
> 
> This should be PTR_ERR(rdev).

Good catch, thanks. Fixed for v7.

Regards,

Hans


> 
>> +					     "registering %s regulator\n",
>> +					     regulators[i].name);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static struct platform_driver tps68470_regulator_driver = {
>> +	.driver = {
>> +		.name = "tps68470-regulator",
>> +	},
>> +	.probe = tps68470_regulator_probe,
>> +};
>> +
>> +/*
>> + * The ACPI tps68470 probe-ordering depends on the clk/gpio/regulator drivers
>> + * registering before the drivers for the camera-sensors which use them bind.
>> + * subsys_initcall() ensures this when the drivers are builtin.
>> + */
>> +static int __init tps68470_regulator_init(void)
>> +{
>> +	return platform_driver_register(&tps68470_regulator_driver);
>> +}
>> +subsys_initcall(tps68470_regulator_init);
>> +
>> +static void __exit tps68470_regulator_exit(void)
>> +{
>> +	platform_driver_unregister(&tps68470_regulator_driver);
>> +}
>> +module_exit(tps68470_regulator_exit);
>> +
>> +MODULE_ALIAS("platform:tps68470-regulator");
>> +MODULE_DESCRIPTION("TPS68470 voltage regulator driver");
>> +MODULE_LICENSE("GPL v2");
> 

