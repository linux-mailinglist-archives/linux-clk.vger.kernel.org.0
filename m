Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA85972CBF9
	for <lists+linux-clk@lfdr.de>; Mon, 12 Jun 2023 19:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236165AbjFLRDL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 12 Jun 2023 13:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233565AbjFLRDK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 13:03:10 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1085BE0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 10:03:08 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f74d6695e4so698145e87.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686589386; x=1689181386;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/2ZB5BiuPmDVQYwRR2+GIOAeOu1Mqoq+C+KfOecmuk=;
        b=PrWo5yYQm3aA1KbMC1HgwnoEpRrCGwvbVBKZtPrjijP3eKHwkMKTluLTtnd3C4Krf7
         bfiZDp/tGA8T6OapJ55RgwKZ9LwL5XXXWgHveb2I/7DB7zRNuLvHP7wDve6puievelK0
         McQI6sLCOUYGVOx01zjYQG0yEEFMM0NztOf8td8AO1Omacld1N/nsRvXFGQVIMtphuJC
         J52KZg2c2HbQP6zgmXTl6XYoVxfDcHDJzqxxuuBRsGzq+KKIht1W3r8rjIDGHWMFex4e
         6v3txStvu+RW1Wb7hXM4omuK1Xec60N6S0Diy07c4CDfXmZo5U00rbi38ee8WWRoGvYY
         MUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686589386; x=1689181386;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/2ZB5BiuPmDVQYwRR2+GIOAeOu1Mqoq+C+KfOecmuk=;
        b=eu9zrd953zexxChrYVZscyaUKWht5nJp5Kwwpx3UniOWh8/FQb8uRf/6zsm/pnZ+2S
         QtULyi35VivcO4/oxYCBlD/o0nyzc0nFAB7mkkiE7a7s06CapziVXsiV7g+OtmHUeiNy
         05GIUBV9YmqmBlmUIpy7grkOyxy68j8nv5bIqZ6v9bMEdCPrEhphatugkFX0qoGH5acE
         uzrgpUwEAnPRjOsRqtyHxGxoUxS4+2JrVa1woz05agVYA7L6VShyzL0u/KeXFshTrVQH
         h87GzhVQLjRy4fqqNEVn/XSptI5lB7Czm8SxB2g6XkydrS4OmMUmLmjSpBV13ck6Sg3Q
         Rcxg==
X-Gm-Message-State: AC+VfDwaEq7lNfYcI3ic7DbLeaEEyhK/n1XOt0Qtdhyp+vVVh8i58a5h
        DLaK1413EXsOzZHAfXIgkHPHHQ==
X-Google-Smtp-Source: ACHHUZ6F3uloCkMgpiymHDH0jwCx9f9HppT1U79o12pyC+gLNrovURXtZFy2Qp9rPHczrW8TJiStSQ==
X-Received: by 2002:a19:770e:0:b0:4eb:e8e:4139 with SMTP id s14-20020a19770e000000b004eb0e8e4139mr3139208lfc.2.1686589386257;
        Mon, 12 Jun 2023 10:03:06 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id s9-20020a19ad49000000b004f5bc4e80easm1497296lfd.171.2023.06.12.10.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 10:03:05 -0700 (PDT)
Message-ID: <ffd2df1e-71fa-ada1-ed95-69612f3b5072@linaro.org>
Date:   Mon, 12 Jun 2023 19:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 04/22] clk: qcom: smd-rpm: Export clock scaling
 availability
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20230526-topic-smd_icc-v2-0-e5934b07d813@linaro.org>
 <20230526-topic-smd_icc-v2-4-e5934b07d813@linaro.org>
 <ZIRgGXwKD6mcgTRY@gerhold.net>
 <40f937bb-0d7e-a237-1672-5905983622ce@linaro.org>
 <b7b1d19c-b87d-b3fd-36aa-374065a45ede@linaro.org>
 <ZITOR3Y25Bv4msdm@gerhold.net>
 <c52f0311-a8a0-79af-2a08-51a8564a8b25@linaro.org>
 <ZIWR7uVHJ-eJWhHw@gerhold.net>
 <b700b444-0b14-7cee-4edc-d2f1183c66bb@linaro.org>
In-Reply-To: <b700b444-0b14-7cee-4edc-d2f1183c66bb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 12.06.2023 14:51, Konrad Dybcio wrote:
> On 11.06.2023 11:20, Stephan Gerhold wrote:
>> On Sat, Jun 10, 2023 at 09:39:00PM +0200, Konrad Dybcio wrote:
>>> On 10.06.2023 21:25, Stephan Gerhold wrote:
>>>> On Sat, Jun 10, 2023 at 08:53:05PM +0200, Konrad Dybcio wrote:
>>>>> On 10.06.2023 14:15, Konrad Dybcio wrote:
>>>>>> On 10.06.2023 13:35, Stephan Gerhold wrote:
>>>>>>> On Fri, Jun 09, 2023 at 10:19:09PM +0200, Konrad Dybcio wrote:
>>>>>>>> Before we issue a call to RPM through clk_smd_rpm_enable_scaling() the
>>>>>>>> clock rate requests will not be commited in hardware. This poses a
>>>>>>>> race threat since we're accessing the bus clocks directly from within
>>>>>>>> the interconnect framework.
>>>>>>>>
>>>>>>>> Add a marker to indicate that we're good to go with sending new requests
>>>>>>>> and export it so that it can be referenced from icc.
>>>>>>>>
>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>>>> ---
>>>>>>>>  drivers/clk/qcom/clk-smd-rpm.c   | 9 +++++++++
>>>>>>>>  include/linux/soc/qcom/smd-rpm.h | 2 ++
>>>>>>>>  2 files changed, 11 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>>>>>>>> index 937cb1515968..482fe30ee6f0 100644
>>>>>>>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>>>>>>>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>>>>>>>> @@ -151,6 +151,7 @@
>>>>>>>>  #define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)
>>>>>>>>  
>>>>>>>>  static struct qcom_smd_rpm *rpmcc_smd_rpm;
>>>>>>>> +static bool smd_rpm_clk_scaling;
>>>>>>>>  
>>>>>>>>  struct clk_smd_rpm {
>>>>>>>>  	const int rpm_res_type;
>>>>>>>> @@ -385,6 +386,12 @@ static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
>>>>>>>>  	return r->rate;
>>>>>>>>  }
>>>>>>>>  
>>>>>>>> +bool qcom_smd_rpm_scaling_available(void)
>>>>>>>> +{
>>>>>>>> +	return smd_rpm_clk_scaling;
>>>>>>>> +}
>>>>>>>> +EXPORT_SYMBOL_GPL(qcom_smd_rpm_scaling_available);
>>>>>>>> +
>>>>>>>>  static int clk_smd_rpm_enable_scaling(void)
>>>>>>>>  {
>>>>>>>>  	int ret;
>>>>>>>> @@ -410,6 +417,8 @@ static int clk_smd_rpm_enable_scaling(void)
>>>>>>>>  		return ret;
>>>>>>>>  	}
>>>>>>>>  
>>>>>>>> +	smd_rpm_clk_scaling = true;
>>>>>>>> +
>>>>>>>
>>>>>>> If you move the platform_device_register_data(&rpdev->dev,
>>>>>>> "icc_smd_rpm", ...) from drivers/soc/qcom/smd-rpm.c to here you can
>>>>>>> avoid the race completely and drop this API. I think that would be
>>>>>>> cleaner. And it will likely probe much faster because probe deferral
>>>>>>> is slow. :)
>>>>>> Sounds like an idea.. especially since it's pretty much the only
>>>>>> dependency other than SMDRPM itself!
>>>>> It sounds great, but to not break bisecting one has to:
>>>>>
>>>>> 1. change the registration in soc/smd-rpm to store rpm ptr in driver
>>>>>    data, in addition to parent driver data
>>>>>
>>>>> 2. change icc/smd-rpm to use the device and not parent data
>>>>>
>>>>> 3. add a platform_device_register_data call in clk-smd-rpm that will
>>>>>    always fail because the device is always registered
>>>>>
>>>>> 4. remove the registration from soc/smd-rpm
>>>>>
>>>>
>>>> Logically the icc_smd_rpm device still fits better as child of
>>>> smd-rpm and not clk-smd-rpm. So I would probably just continue
>>>> registering it on the parent device from clk-smd-rpm.
>>>> Then there are no changes necessary in icc_smd_rpm.
>>>>
>>>> You could use this. Both touched files are Bjorn-maintained so should be
>>>> manageable to have it in one commit. (note: compile-tested only)
>>>>
>>>> Thanks,
>>>> Stephan
>>>>
>>>> From a2610adb2551b01e76b9de8e4cbcc89853814a8f Mon Sep 17 00:00:00 2001
>>>> From: Stephan Gerhold <stephan@gerhold.net>
>>>> Date: Sat, 10 Jun 2023 21:19:48 +0200
>>>> Subject: [PATCH] soc: qcom: smd-rpm: Move icc_smd_rpm registration to
>>>>  clk-smd-rpm
>>>>
>>>> icc_smd_rpm will do bus clock votes itself rather than taking the
>>>> unnecessary detour through the clock subsystem. However, it can only
>>>> do that after the clocks have been handed off and scaling has been
>>>> enabled in the RPM in clk-smd-rpm.
>>>>
>>>> Move the icc_smd_rpm registration from smd-rpm.c to clk-smd-rpm.c
>>>> to avoid any possible races. icc_smd_rpm gets the driver data from
>>>> the smd-rpm device, so still register the platform device on the
>>>> smd-rpm parent device.
>>>>
>>>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>>>> ---
>>> Generally it looks good.. I'll give it a spin next week. One
>>> thing below.
>>>
>>>>  drivers/clk/qcom/clk-smd-rpm.c | 21 +++++++++++++++++++++
>>>>  drivers/soc/qcom/smd-rpm.c     | 23 +----------------------
>>>>  2 files changed, 22 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>>>> index e4de74b68797..91adb16889b3 100644
>>>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>>>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>>>> @@ -1302,12 +1302,20 @@ static struct clk_hw *qcom_smdrpm_clk_hw_get(struct of_phandle_args *clkspec,
>>>>  	return desc->clks[idx] ? &desc->clks[idx]->hw : ERR_PTR(-ENOENT);
>>>>  }
>>>>  
>>>> +static void rpm_smd_unregister_icc(void *data)
>>>> +{
>>>> +	struct platform_device *icc_pdev = data;
>>>> +
>>>> +	platform_device_unregister(icc_pdev);
>>>> +}
>>>> +
>>>>  static int rpm_smd_clk_probe(struct platform_device *pdev)
>>>>  {
>>>>  	int ret;
>>>>  	size_t num_clks, i;
>>>>  	struct clk_smd_rpm **rpm_smd_clks;
>>>>  	const struct rpm_smd_clk_desc *desc;
>>>> +	struct platform_device *icc_pdev;
>>>>  
>>>>  	rpmcc_smd_rpm = dev_get_drvdata(pdev->dev.parent);
>>>>  	if (!rpmcc_smd_rpm) {
>>>> @@ -1357,6 +1365,19 @@ static int rpm_smd_clk_probe(struct platform_device *pdev)
>>>>  	if (ret)
>>>>  		goto err;
>>>>  
>>>> +	icc_pdev = platform_device_register_data(pdev->dev.parent,
>>>> +						 "icc_smd_rpm", -1, NULL, 0);
>>>> +	if (IS_ERR(icc_pdev)) {
>>>> +		dev_err(&pdev->dev, "Failed to register icc_smd_rpm device: %pE\n",
>>>> +			icc_pdev);
>>>> +		/* No need to unregister clocks because of this */
>>>> +	} else {
>>>> +		ret = devm_add_action_or_reset(&pdev->dev, rpm_smd_unregister_icc,
>>>> +					       icc_pdev);
>>>> +		if (ret)
>>>> +			goto err;
>>>> +	}
>>>> +
>>>>  	return 0;
>>>>  err:
>>>>  	dev_err(&pdev->dev, "Error registering SMD clock driver (%d)\n", ret);
>>>> diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
>>>> index 0c1aa809cc4e..427dd5392b82 100644
>>>> --- a/drivers/soc/qcom/smd-rpm.c
>>>> +++ b/drivers/soc/qcom/smd-rpm.c
>>>> @@ -19,7 +19,6 @@
>>>>  /**
>>>>   * struct qcom_smd_rpm - state of the rpm device driver
>>>>   * @rpm_channel:	reference to the smd channel
>>>> - * @icc:		interconnect proxy device
>>>>   * @dev:		rpm device
>>>>   * @ack:		completion for acks
>>>>   * @lock:		mutual exclusion around the send/complete pair
>>>> @@ -27,7 +26,6 @@
>>>>   */
>>>>  struct qcom_smd_rpm {
>>>>  	struct rpmsg_endpoint *rpm_channel;
>>>> -	struct platform_device *icc;
>>>>  	struct device *dev;
>>>>  
>>>>  	struct completion ack;
>>>> @@ -197,7 +195,6 @@ static int qcom_smd_rpm_callback(struct rpmsg_device *rpdev,
>>>>  static int qcom_smd_rpm_probe(struct rpmsg_device *rpdev)
>>>>  {
>>>>  	struct qcom_smd_rpm *rpm;
>>>> -	int ret;
>>>>  
>>>>  	rpm = devm_kzalloc(&rpdev->dev, sizeof(*rpm), GFP_KERNEL);
>>>>  	if (!rpm)
>>>> @@ -210,24 +207,7 @@ static int qcom_smd_rpm_probe(struct rpmsg_device *rpdev)
>>>>  	rpm->rpm_channel = rpdev->ept;
>>>>  	dev_set_drvdata(&rpdev->dev, rpm);
>>>>  
>>>> -	rpm->icc = platform_device_register_data(&rpdev->dev, "icc_smd_rpm", -1,
>>>> -						 NULL, 0);
>>>> -	if (IS_ERR(rpm->icc))
>>>> -		return PTR_ERR(rpm->icc);
>>>> -
>>>> -	ret = of_platform_populate(rpdev->dev.of_node, NULL, NULL, &rpdev->dev);
>>>> -	if (ret)
>>>> -		platform_device_unregister(rpm->icc);
>>>> -
>>>> -	return ret;
>>>> -}
>>>> -
>>>> -static void qcom_smd_rpm_remove(struct rpmsg_device *rpdev)
>>>> -{
>>>> -	struct qcom_smd_rpm *rpm = dev_get_drvdata(&rpdev->dev);
>>>> -
>>>> -	platform_device_unregister(rpm->icc);
>>>> -	of_platform_depopulate(&rpdev->dev);
>>>> +	return devm_of_platform_populate(&rpdev->dev);
>>>>  }
>>>>  
>>>>  static const struct of_device_id qcom_smd_rpm_of_match[] = {
>>>> @@ -256,7 +236,6 @@ MODULE_DEVICE_TABLE(of, qcom_smd_rpm_of_match);
>>>>  
>>>>  static struct rpmsg_driver qcom_smd_rpm_driver = {
>>>>  	.probe = qcom_smd_rpm_probe,
>>>> -	.remove = qcom_smd_rpm_remove,
>>> This reaches over the removal of the icc registration, the depopulate
>>> call should stay.
>>>
>>
>> I switched the of_platform_populate() to devm_of_platform_populate(),
>> that's why the remove callback is no longer necessary. It's a bit
>> hidden, perhaps it would be enough to add to the commit message:
>>
>> "While at it, switch the remaining of_platform_populate() call to the
>>  devm variant and remove the remove callback."
>>
>> Or maybe it should be split into two patches.
> Gave it a spin, I think it ends up being worse if an IPA rpm clock is
> consumed by one of the icc providers, and that's sadly the case
> for almost all platforms (or supposed to be).. :/ Only qcm2290 doesn't
> seem to care if we poke the network interface units with half the soc
> off :P
Actually it's more complex and that rings the same tons-of-probe-deferrals
bell that we have to get rid of.. The icc_smd_rpm driver actually does
probe faster with your patch, but that's not the case with the SoC icc
provider driver which does probe later :/

Don't think either solution is perfect, but I'm willing to take your
solution, as the one I proposed is a bit of a dead end for future
improvements.

Konrad
> 
> Konrad
>>
>> Thanks,
>> Stephan
