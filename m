Return-Path: <linux-clk+bounces-6149-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 649F08AA4BB
	for <lists+linux-clk@lfdr.de>; Thu, 18 Apr 2024 23:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BE29282E93
	for <lists+linux-clk@lfdr.de>; Thu, 18 Apr 2024 21:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558C3194C99;
	Thu, 18 Apr 2024 21:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jm3IwghL"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D486194C81
	for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 21:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713475810; cv=none; b=K8YHMi/gtkOn9itlLRjb6GxOQM2tNwjaXO8WBD1UPQ+0KQGl+zDkk4beRhlJ6aNr8pmT0XUUMwPZspQJ+Q51EMD5Tl4R7rgzRbaLPnEgou5QKq5g/E5HdLOgyH743B/rVkdpRDfOvpbLJGqM/5s7wzNIUWLETZ+8w501MQ6c1lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713475810; c=relaxed/simple;
	bh=cpDM8L6OHah3avE6wDxgUZELGEpUx0ctoqYBcMafIXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKfILCfpgZrs+ugrhgxP+SgCab1Ol3tCzQ4iQ+cnmsHBqnA3IutzvjSYXPQfj/LnaqR2llT2FQSUMLQwivYYSrwtCfDgEtFbQjKAYOGjRi1oBzqBkfG+1CcdnEN6v4qdOScTp7Nk8WWt/30igUrOtWZujOLqI2OmTrBBKmHO1vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jm3IwghL; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2dac628f081so3199181fa.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 14:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713475806; x=1714080606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F2JxZjzCfFi0cg1MiiRP0r6h7e+n3EHfY6QvzIGmppo=;
        b=jm3IwghLhVD2AGNhk1v05vsuOTIC/C4iMoz1nH+Z8yvdmYXvN88GmL+Gj57fR4dvzz
         /LjY9WI24SkTQx02lnqwOucSIHeJv+HaZlUSzLwfkoV104CyBEUXRADehnwVvoienHZv
         fH7cGynfCs/OY9rOeW69BhgvdhBHi4QkVttoTysUqm6tXc2JJ2KcDYdh6lpe6Gmdqhfk
         yPO5i4LnFEiJsTl/wNLbyiLwPWSwf1QEG/Z+VRCABEYYMtbm/XSyPRCdv3v9+nC3RIAk
         1BRAe+Yk6LXS5ci/+mVVLFMe3q3Luli2ntlAxxlYesEbAFFE4tHKOpLg7bWiE0R72NPt
         fTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713475806; x=1714080606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2JxZjzCfFi0cg1MiiRP0r6h7e+n3EHfY6QvzIGmppo=;
        b=ssAGz10qtinu71w/wC/LthsO2rsz4Lw2ksd8mJMgYA7PvNR7b3RoOsIJ97tGCQokIg
         2t1kiBPdfeT7001jTJLskOaduAeB3AcEsetni4HBVTuoL72IZrvQ0hLnAmLW2B4zI03m
         6CqxCZGyIfIjdFVCOt6zzGUk6PP0mbbo1hNSMGgDIMAwXt76Gs+8l15Wjw+e7xHQ/qU+
         lSw25cJtNS6Sk8W9qfpogDoqd8vbvMiuRvJoUzJ0eBO8PEdfOQTkPh+cUnUBZxDh32E3
         EG10iKdXy5V9fXV0vbkNc+g4ie/SJ4KA2qWeFGMAYwBQ3//vwuavhUYAa7wCdXRR9zOC
         7YVA==
X-Forwarded-Encrypted: i=1; AJvYcCX8CEQvZ5id5NdNHa8HH2JnQ1e/b+IUqhR71P0KW6B5d4HEzKuDsa6HoSqX1Ni3xeIFSEtcm31uUrSltpuzy81UUSewUhpMXUa8
X-Gm-Message-State: AOJu0Ywa2Z++17mSXSNkupeCt65SE5FngWuGMxEXIp+XyJLpsTqPvAg8
	Qo6HnwMntxvjooxGvoLpwpkTZfte6Tdgj7tzfPr7ShoFgXCARRx6gmstA4W0hZk=
X-Google-Smtp-Source: AGHT+IH/3Yq/Ktem1SmhiXkQPh/65iSEA5i+JYHQ2E5BgfZi3FI11aebV6LCBujfJdvK0CPtVINjkA==
X-Received: by 2002:ac2:4db9:0:b0:513:ec32:aa89 with SMTP id h25-20020ac24db9000000b00513ec32aa89mr131793lfe.2.1713475806519;
        Thu, 18 Apr 2024 14:30:06 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id v28-20020a056512049c00b00519558f5d83sm397704lfq.289.2024.04.18.14.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 14:30:06 -0700 (PDT)
Message-ID: <d3d3be20-7ec0-419c-b5a3-77047d8bc7bf@linaro.org>
Date: Fri, 19 Apr 2024 00:30:05 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 RESEND 5/6] clk: qcom: camcc-sm8650: Add SM8650 camera
 clock controller driver
Content-Language: en-US
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20240321092529.13362-1-quic_jkona@quicinc.com>
 <20240321092529.13362-6-quic_jkona@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240321092529.13362-6-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Jagadeesh,

thank you for submitting the clock driver.

On 3/21/24 11:25, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on SM8650 platform.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/clk/qcom/Kconfig        |    8 +
>   drivers/clk/qcom/Makefile       |    1 +
>   drivers/clk/qcom/camcc-sm8650.c | 3591 +++++++++++++++++++++++++++++++
>   3 files changed, 3600 insertions(+)
>   create mode 100644 drivers/clk/qcom/camcc-sm8650.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 8ab08e7b5b6c..6257f4a02ec4 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -826,6 +826,14 @@ config SM_CAMCC_8550
>   	  Support for the camera clock controller on SM8550 devices.
>   	  Say Y if you want to support camera devices and camera functionality.
>   
> +config SM_CAMCC_8650
> +	tristate "SM8650 Camera Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select SM_GCC_8650
> +	help
> +	  Support for the camera clock controller on SM8650 devices.
> +	  Say Y if you want to support camera devices and camera functionality.
> +
>   config SM_DISPCC_6115
>   	tristate "SM6115 Display Clock Controller"
>   	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index dec5b6db6860..28bffa1eb8dd 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -109,6 +109,7 @@ obj-$(CONFIG_SM_CAMCC_6350) += camcc-sm6350.o
>   obj-$(CONFIG_SM_CAMCC_8250) += camcc-sm8250.o
>   obj-$(CONFIG_SM_CAMCC_8450) += camcc-sm8450.o
>   obj-$(CONFIG_SM_CAMCC_8550) += camcc-sm8550.o
> +obj-$(CONFIG_SM_CAMCC_8650) += camcc-sm8650.o
>   obj-$(CONFIG_SM_DISPCC_6115) += dispcc-sm6115.o
>   obj-$(CONFIG_SM_DISPCC_6125) += dispcc-sm6125.o
>   obj-$(CONFIG_SM_DISPCC_6350) += dispcc-sm6350.o
> diff --git a/drivers/clk/qcom/camcc-sm8650.c b/drivers/clk/qcom/camcc-sm8650.c
> new file mode 100644
> index 000000000000..1b28e086e519
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-sm8650.c
> @@ -0,0 +1,3591 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,sm8650-camcc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_IFACE,
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,
> +	DT_SLEEP_CLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_BI_TCXO_AO,
> +	P_CAM_CC_PLL0_OUT_EVEN,
> +	P_CAM_CC_PLL0_OUT_MAIN,
> +	P_CAM_CC_PLL0_OUT_ODD,
> +	P_CAM_CC_PLL1_OUT_EVEN,
> +	P_CAM_CC_PLL2_OUT_EVEN,
> +	P_CAM_CC_PLL2_OUT_MAIN,
> +	P_CAM_CC_PLL3_OUT_EVEN,
> +	P_CAM_CC_PLL4_OUT_EVEN,
> +	P_CAM_CC_PLL5_OUT_EVEN,
> +	P_CAM_CC_PLL6_OUT_EVEN,
> +	P_CAM_CC_PLL7_OUT_EVEN,
> +	P_CAM_CC_PLL8_OUT_EVEN,
> +	P_CAM_CC_PLL9_OUT_EVEN,
> +	P_CAM_CC_PLL9_OUT_ODD,
> +	P_CAM_CC_PLL10_OUT_EVEN,
> +	P_SLEEP_CLK,
> +};
> +
> +static const struct pll_vco lucid_ole_vco[] = {
> +	{ 249600000, 2300000000, 0 },
> +};

I've noticed that a downstream Android kernel v6.1.25 defines this clock as

	static const struct pll_vco lucid_ole_vco[] = {
		{ 249600000, 2100000000, 0 },
	};

Do you know any particular reason why here the clock frequencies are different?

> +
> +static const struct pll_vco rivian_ole_vco[] = {
> +	{ 777000000, 1285000000, 0 },
> +};
> +

<snip>

> +static struct clk_rcg2 cam_cc_bps_clk_src = {
> +	.cmd_rcgr = 0x10050,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_2,
> +	.freq_tbl = ftbl_cam_cc_bps_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_bps_clk_src",
> +		.parent_data = cam_cc_parent_data_2,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};

Please let me ask after Dmitry about your rationale to select
&clk_rcg2_shared_ops here and below for all *_src clocks introduced in
the driver, I do remember you've did it in v1, could you please
elaborate it a bit more?

I have a concern that it's not possible to get an .is_enabled status
of the shared clocks, however at least in this particular case of
camcc clocks it seems to be technically possible.

It might indicate that there is an incompleteness in clk-rcg2.c driver
also, if it's really possible to get is_enabled runtime status at least
for some of the shared clocks.

> +
> +static const struct freq_tbl ftbl_cam_cc_camnoc_axi_rt_clk_src[] = {
> +	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
> +	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
> +	{ }
> +};
> +

<snip>

Other than two my open questions above I don't see any issues with the
driver, if you be kind to provide the answers, please feel free to add
my

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir


