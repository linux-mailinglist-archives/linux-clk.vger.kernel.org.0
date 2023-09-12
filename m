Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A24F79D349
	for <lists+linux-clk@lfdr.de>; Tue, 12 Sep 2023 16:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235818AbjILOJW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 12 Sep 2023 10:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbjILOJW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Sep 2023 10:09:22 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B62C1;
        Tue, 12 Sep 2023 07:09:18 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C5HBF8015086;
        Tue, 12 Sep 2023 14:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=AJEtOlWG3SOGORqqwQHYKtRlzQKBh6Ir+yq66oeVqlk=;
 b=XpYBM1qYEM4aPWt+8XrBGmQd7F4MgByx65ThFA7SZWHxwR1pTY+bQYCEbiQEdYgjmreG
 JI7z0iPRuRAV1mRVh7MOMgy3srqtixBNA/0Pbzl9bGtXeVSoKyz3+YDcdFSk30GCYCvd
 AIxF/gusk09KRU2s0BQSXdrRI4LI3J0QpazPFuRclCyThp2AmgMCyPqP9HDkBxytxa5I
 P8nRys1kCF+asoqw2fxZbsGx9DEV+DAGbK3Yd2A4WgYR154yYCB/IRok7CLFnnAzPlDM
 jrFVTOwy9RQ3p7dtpthgE8Lk7kIZUnCg/37foaQfFR69pU9PROXGzsSuqDkXlDOGB4Br 5A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t29b0j81t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 14:08:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CE8Udt020212
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 14:08:30 GMT
Received: from [10.216.43.40] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 12 Sep
 2023 07:08:22 -0700
Message-ID: <652b55cc-87dd-46d1-e480-e25f5f22b8d8@quicinc.com>
Date:   Tue, 12 Sep 2023 19:38:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH V2 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     <andersson@kernel.org>, <agross@kernel.org>,
        <konrad.dybcio@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <arnd@arndb.de>, <geert+renesas@glider.be>,
        <nfraprado@collabora.com>, <rafal@milecki.pl>, <peng.fan@nxp.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
        <quic_saahtoma@quicinc.com>
References: <20230825091234.32713-1-quic_devipriy@quicinc.com>
 <20230825091234.32713-6-quic_devipriy@quicinc.com>
 <CAA8EJpr+Wwgot-PDRtj-LVi79aD13B9WVREmjTXiR-8XEEx-rQ@mail.gmail.com>
Content-Language: en-US
From:   Devi Priya <quic_devipriy@quicinc.com>
In-Reply-To: <CAA8EJpr+Wwgot-PDRtj-LVi79aD13B9WVREmjTXiR-8XEEx-rQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P9dRJpXuTP0VCB60emYic4waAGfm0mV-
X-Proofpoint-ORIG-GUID: P9dRJpXuTP0VCB60emYic4waAGfm0mV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_12,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309120117
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 8/25/2023 5:14 PM, Dmitry Baryshkov wrote:
> On Fri, 25 Aug 2023 at 12:15, Devi Priya <quic_devipriy@quicinc.com> wrote:
>>
>> Add Networking Sub System Clock Controller(NSSCC) driver for ipq9574 based
>> devices.
>>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> ---
>>   Changes in V2:
>>          - Added depends on ARM64 || COMPILE_TEST in Kconfig
>>          - Added module_platform_driver
>>          - Dropped patch [2/6] - clk: qcom: gcc-ipq9574: Mark nssnoc clocks as critical
>>             & added pm_clk for nssnoc clocks
>>          - Updated the uniphy clock names
>>
>>   drivers/clk/qcom/Kconfig         |    7 +
>>   drivers/clk/qcom/Makefile        |    1 +
>>   drivers/clk/qcom/nsscc-ipq9574.c | 3109 ++++++++++++++++++++++++++++++
>>   3 files changed, 3117 insertions(+)
>>   create mode 100644 drivers/clk/qcom/nsscc-ipq9574.c
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index bd9bfb11b328..3ecc11e2c8e3 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -203,6 +203,13 @@ config IPQ_GCC_9574
>>            i2c, USB, SD/eMMC, etc. Select this for the root clock
>>            of ipq9574.
>>
>> +config IPQ_NSSCC_9574
>> +       tristate "IPQ9574 NSS Clock Controller"
>> +       depends on ARM64 || COMPILE_TEST
>> +       depends on IPQ_GCC_9574
>> +       help
>> +         Support for NSS clock controller on ipq9574 devices.
>> +
>>   config MSM_GCC_8660
>>          tristate "MSM8660 Global Clock Controller"
>>          depends on ARM || COMPILE_TEST
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 4790c8cca426..3f084928962e 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -30,6 +30,7 @@ obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o
>>   obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
>>   obj-$(CONFIG_IPQ_GCC_8074) += gcc-ipq8074.o
>>   obj-$(CONFIG_IPQ_GCC_9574) += gcc-ipq9574.o
>> +obj-$(CONFIG_IPQ_NSSCC_9574)   += nsscc-ipq9574.o
>>   obj-$(CONFIG_IPQ_LCC_806X) += lcc-ipq806x.o
>>   obj-$(CONFIG_MDM_GCC_9607) += gcc-mdm9607.o
>>   obj-$(CONFIG_MDM_GCC_9615) += gcc-mdm9615.o
>> diff --git a/drivers/clk/qcom/nsscc-ipq9574.c b/drivers/clk/qcom/nsscc-ipq9574.c
>> new file mode 100644
>> index 000000000000..65bdb449ae5f
>> --- /dev/null
>> +++ b/drivers/clk/qcom/nsscc-ipq9574.c
>> @@ -0,0 +1,3109 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/err.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/pm_clock.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include <dt-bindings/clock/qcom,ipq9574-nsscc.h>
>> +#include <dt-bindings/reset/qcom,ipq9574-nsscc.h>
>> +
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-pll.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "clk-regmap-divider.h"
>> +#include "clk-regmap-mux.h"
>> +#include "common.h"
>> +#include "reset.h"
>> +
>> +/* Need to match the order of clocks in DT binding */
>> +enum {
>> +       DT_NSSNOC_NSSCC_CLK,
>> +       DT_NSSNOC_SNOC_CLK,
>> +       DT_NSSNOC_SNOC_1_CLK,
> 
> Not using the index makes it seem that these clocks are not used,
> until one scrolls down to pm_clks.
Okay, got it
> 
> BTW: The NSSNOC_SNOC clocks make it look like there is an interconnect
> here (not a simple NIU).

Hi Dmitry, We are exploring on the ICC driver. In the meantime to 
unblock PCIe/NSS changes getting merged, shall we use regmap_update_bits 
and turn on the critical NSSNOC clocks, ANOC & SNOC pcie clocks in the 
probe function of the gcc driver itself as like sm8550 driver to get the 
changes merged?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/qcom/gcc-sm8550.c#n3347
> 
>> +       DT_BIAS_PLL_CC_CLK,
>> +       DT_BIAS_PLL_NSS_NOC_CLK,
>> +       DT_BIAS_PLL_UBI_NC_CLK,
>> +       DT_GCC_GPLL0_OUT_AUX,
>> +       DT_UNIPHY0_NSS_RX_CLK,
>> +       DT_UNIPHY0_NSS_TX_CLK,
>> +       DT_UNIPHY1_NSS_RX_CLK,
>> +       DT_UNIPHY1_NSS_TX_CLK,
>> +       DT_UNIPHY2_NSS_RX_CLK,
>> +       DT_UNIPHY2_NSS_TX_CLK,
>> +       DT_XO,
> 
> As I wrote, please move DT_XO closer to the beginning of the list.
> 
>> +};
>> +
>> +enum {
>> +       P_BIAS_PLL_CC_CLK,
>> +       P_BIAS_PLL_NSS_NOC_CLK,
>> +       P_BIAS_PLL_UBI_NC_CLK,
>> +       P_GCC_GPLL0_OUT_AUX,
>> +       P_UBI32_PLL_OUT_MAIN,
>> +       P_UNIPHY0_NSS_RX_CLK,
>> +       P_UNIPHY0_NSS_TX_CLK,
>> +       P_UNIPHY1_NSS_RX_CLK,
>> +       P_UNIPHY1_NSS_TX_CLK,
>> +       P_UNIPHY2_NSS_RX_CLK,
>> +       P_UNIPHY2_NSS_TX_CLK,
>> +       P_XO,
>> +};
>> +
>> +static const struct alpha_pll_config ubi32_pll_config = {
>> +       .l = 0x3e,
>> +       .alpha = 0x6666,
>> +       .config_ctl_val = 0x200d4aa8,
>> +       .config_ctl_hi_val = 0x3c,
>> +       .main_output_mask = BIT(0),
>> +       .aux_output_mask = BIT(1),
>> +       .pre_div_val = 0x0,
>> +       .pre_div_mask = BIT(12),
>> +       .post_div_val = 0x0,
>> +       .post_div_mask = GENMASK(9, 8),
>> +       .alpha_en_mask = BIT(24),
>> +       .test_ctl_val = 0x1c0000c0,
>> +       .test_ctl_hi_val = 0x4000,
>> +};
>> +
>> +static struct clk_alpha_pll ubi32_pll_main = {
>> +       .offset = 0x28000,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
>> +       .flags = SUPPORTS_DYNAMIC_UPDATE,
>> +       .clkr = {
>> +               .hw.init = &(const struct clk_init_data) {
>> +                       .name = "ubi32_pll_main",
>> +                       .parent_data = &(const struct clk_parent_data) {
>> +                               .index = DT_XO,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_huayra_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_alpha_pll_postdiv ubi32_pll = {
>> +       .offset = 0x28000,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
>> +       .width = 2,
>> +       .clkr.hw.init = &(const struct clk_init_data) {
>> +               .name = "ubi32_pll",
>> +               .parent_hws = (const struct clk_hw *[]) {
>> +                       &ubi32_pll_main.clkr.hw
>> +               },
>> +               .num_parents = 1,
>> +               .ops = &clk_alpha_pll_postdiv_ro_ops,
>> +               .flags = CLK_SET_RATE_PARENT,
>> +       },
>> +};
>> +
> 
> [skipped clock tables, LGTM]
> 
>> +static const struct of_device_id nss_cc_ipq9574_match_table[] = {
>> +       { .compatible = "qcom,ipq9574-nsscc" },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, nss_cc_ipq9574_match_table);
>> +
>> +static int nss_cc_ipq9574_probe(struct platform_device *pdev)
>> +{
>> +       struct regmap *regmap;
>> +       struct qcom_cc_desc nsscc_ipq9574_desc = nss_cc_ipq9574_desc;
>> +
>> +       int ret;
>> +
>> +       ret = devm_pm_runtime_enable(&pdev->dev);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       ret = devm_pm_clk_create(&pdev->dev);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       ret = of_pm_clk_add_clk(&pdev->dev, "nssnoc_nsscc");
> 
> As we are switching to DT indices, better add new API that takes index
> rather than mixing indices and names.
sure okay

Thanks,
Devi Priya
> 
>> +       if (ret < 0) {
>> +               dev_err(&pdev->dev, "Failed to acquire nssnoc_nsscc clock\n");
>> +               return ret;
>> +       }
>> +
>> +       ret = of_pm_clk_add_clk(&pdev->dev, "nssnoc_snoc");
>> +       if (ret < 0) {
>> +               dev_err(&pdev->dev, "Failed to acquire nssnoc_snoc clock\n");
>> +               return ret;
>> +       }
>> +
>> +       ret = of_pm_clk_add_clk(&pdev->dev, "nssnoc_snoc_1");
>> +       if (ret < 0) {
>> +               dev_err(&pdev->dev, "Failed to acquire nssnoc_snoc_1 clock\n");
>> +               return ret;
>> +       }
>> +
>> +       ret = pm_runtime_get(&pdev->dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       regmap = qcom_cc_map(pdev, &nsscc_ipq9574_desc);
>> +       if (IS_ERR(regmap))
>> +               return PTR_ERR(regmap);
>> +
>> +       clk_alpha_pll_configure(&ubi32_pll_main, regmap, &ubi32_pll_config);
>> +
>> +       return qcom_cc_really_probe(pdev, &nsscc_ipq9574_desc, regmap);
>> +}
>> +
>> +static const struct dev_pm_ops nss_cc_pm_ops = {
>> +       SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
>> +
>> +static struct platform_driver nss_cc_ipq9574_driver = {
>> +       .probe = nss_cc_ipq9574_probe,
>> +       .driver = {
>> +               .name = "qcom,nsscc-ipq9574",
>> +               .of_match_table = nss_cc_ipq9574_match_table,
>> +               .pm = &nss_cc_pm_ops,
>> +       },
>> +};
>> +
>> +module_platform_driver(nss_cc_ipq9574_driver);
>> +
>> +MODULE_DESCRIPTION("QTI NSS_CC IPQ9574 Driver");
>> +MODULE_LICENSE("GPL");
>> --
>> 2.34.1
>>
> 
> 
