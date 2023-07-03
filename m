Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F255A745AF7
	for <lists+linux-clk@lfdr.de>; Mon,  3 Jul 2023 13:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbjGCLZq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 3 Jul 2023 07:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjGCLZp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Jul 2023 07:25:45 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C01AE3
        for <linux-clk@vger.kernel.org>; Mon,  3 Jul 2023 04:25:43 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so6463453e87.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Jul 2023 04:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688383542; x=1690975542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9WdozChFsFYvvUHvSbtJ3sspvPuomZmaSBZHoeBEJk=;
        b=xRTPyj9sAl4m7EOdkpwI2xVdWSgdWUa+fiigWnQpUb3W2Bj4L7ljLfFfKN3Ju10K0T
         wPUeKBC1LjvOuKZyWpmmQLe53oPracjogN7GYAYOaetl1kALq0vBaDtTKnxBnMuG8H/N
         Snje6+x2B+sSd/OxoAAyBcf0SP2RkFfuveGFDzoH7iop9GQpDmuLrmmQIZiSvDzFGT+7
         s9eaWLeH+UJ2f4L4Qkm5jgjT4jOEoTncs+0df8H1FliPYee1/JDa9WPfeSxtCrft3IJx
         zRSUnn4rM37GX1wNkCDAi4Mu5zpalAr9mfdp0ok5z/Gdy1XLH29fL9Fo86cYDBXwgAPi
         oY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688383542; x=1690975542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9WdozChFsFYvvUHvSbtJ3sspvPuomZmaSBZHoeBEJk=;
        b=X5K5mdwtUmk8V6uBjdsWxyMAqILAWiDj6ef2mk5myQdxd3TRhyfSpbM7KmQn4yVS3/
         nJN2jkXa7bWkTGFhFrom2hdzVN8KFpjOKy/bQ2hljALJjcuT2qslFpJipaGVxWFAJpro
         ZQppeSyh95EcB399OFd4Z9iKkKP4rsf9+51selIudO0OWFHpTO6+QhgEeoFsfzs+O3wA
         NKPT/JWnoFQ6VuCw1g9/O0dHJxoopgUV0hYzWUEG2XtYZkwfc8ZRVTYSkbTXZN9w3dCv
         JXWUf+l0fPsz6+8orpsYP2eFKaNLNXbUnuG1tw1TXUyzI6fUwFGyB3yN/mG8OuTB6Ves
         /6EA==
X-Gm-Message-State: ABy/qLbJ/ktmycQsxV9+cqAoRFCVGKr5GnSR3s2yVqn0uaP/Z3Yaeolv
        vXATzAdC/xkRKz5IIkUzRpnR5g==
X-Google-Smtp-Source: APBJJlG5Y7Tc96vuarwpqakRVJXEaTRW+5oWJPXCPiyzz23dUck4iSRnLy19HZcY+hqDXzCHBc9AwQ==
X-Received: by 2002:a05:6512:456:b0:4fb:8f79:631 with SMTP id y22-20020a056512045600b004fb8f790631mr7384933lfk.46.1688383541733;
        Mon, 03 Jul 2023 04:25:41 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id o16-20020a05651238b000b004fb8a2b9485sm3023334lft.248.2023.07.03.04.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:25:41 -0700 (PDT)
Message-ID: <d38dc641-285a-4645-47a8-77117dbefbb1@linaro.org>
Date:   Mon, 3 Jul 2023 13:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 13/28] soc: qcom: Add driver for Qualcomm Krait L2
 cache scaling
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
 <20230702174246.121656-14-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702174246.121656-14-dmitry.baryshkov@linaro.org>
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

On 2.07.2023 19:42, Dmitry Baryshkov wrote:
> Add a simple driver that handles scaling of L2 frequency and voltages.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
[...]

> +/* vdd-mem and vdd-dig */
> +#define NUM_SUPPLIES 2
> +static int krait_l2_config_regulators(struct device *dev,
> +				      struct dev_pm_opp *old_opp,
> +				      struct dev_pm_opp *new_opp,
> +				      struct regulator **regulators,
> +				      unsigned int count)
> +{
> +	struct dev_pm_opp_supply supplies[NUM_SUPPLIES];
> +	unsigned long old_freq, freq;
> +	unsigned int i;
> +	int ret;
> +
> +	if (WARN_ON_ONCE(count != NUM_SUPPLIES))
> +		return -EINVAL;
> +
> +	ret = dev_pm_opp_get_supplies(new_opp, supplies);
> +	if (WARN_ON(ret))
> +		return ret;
> +
> +	old_freq = dev_pm_opp_get_freq(old_opp);
> +	freq = dev_pm_opp_get_freq(new_opp);
> +
> +	WARN_ON(!old_freq || !freq);
> +	if (freq > old_freq) {
> +		for (i = 0; i < count; i++) {
> +			ret = krait_l2_set_one_supply(dev, regulators[i], &supplies[i]);
> +			if (ret)
> +				goto restore_backwards;
> +		}
// name the 0 and 1
ret = krait_l2_set_one_supply(dev, regulators[0], &supplies[0]);
if (ret)
	return ret;

ret = krait_l2_set_one_supply(dev, regulators[1], &supplies[1]);
if (ret) {
	dev_pm_opp_get_supplies(old_opp, supplies);

	return krait_l2_set_one_supply(dev, regulators[0], &supplies[0]);
}

> +	} else {
> +		for (i = count; i > 0; i--) {
> +			ret = krait_l2_set_one_supply(dev, regulators[i - 1], &supplies[i - 1]);
> +			if (ret)
> +				goto restore_forward;
> +		}
> +	}
analogous

> +
> +	return 0;
> +
> +restore_backwards:
and this part \/ becomes redundant

> +
> +	dev_pm_opp_get_supplies(old_opp, supplies);
> +
> +	for (; i > 0; i--)
> +		krait_l2_set_one_supply(dev, regulators[i - 1], &supplies[i - 1]);
> +
> +	return ret;
> +
> +restore_forward:
> +
> +	dev_pm_opp_get_supplies(old_opp, supplies);
> +
> +	for ( ; i < count; i++)
> +		krait_l2_set_one_supply(dev, regulators[i], &supplies[i]);
> +
> +	return ret;
> +}
> +
> +static int krait_l2_probe(struct platform_device *pdev)
> +{
> +	struct dev_pm_opp_config krait_l2_cfg = {
> +		.clk_names = (const char * const[]) { NULL, NULL },
> +		.config_regulators = krait_l2_config_regulators,
> +		.regulator_names = (const char * const[]) { "vdd-mem", "vdd-dig", NULL },
> +	};
> +	struct icc_clk_data data[] = {
> +		{ .name = "l2", .opp = true},
true }

Konrad
> +	};
> +
> +	struct device *dev = &pdev->dev;
> +	struct icc_provider *provider;
> +	struct clk *clk;
> +	int ret;
> +
> +	clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	ret = devm_pm_opp_set_config(dev, &krait_l2_cfg);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_pm_opp_of_add_table(dev);
> +	if (ret)
> +		return ret;
> +
> +	data[0].clk = clk;
> +	provider = icc_clk_register(dev, L2_MASTER_NODE, ARRAY_SIZE(data), data);
> +	if (IS_ERR(provider))
> +		return PTR_ERR(provider);
> +
> +	platform_set_drvdata(pdev, provider);
> +
> +	return 0;
> +}
> +
> +static int krait_l2_remove(struct platform_device *pdev)
> +{
> +	struct icc_provider *provider = platform_get_drvdata(pdev);
> +
> +	icc_clk_unregister(provider);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id krait_l2_match_table[] = {
> +	{ .compatible = "qcom,krait-l2-cache" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, krait_l2_match_table);
> +
> +static struct platform_driver krait_l2_driver = {
> +	.probe = krait_l2_probe,
> +	.remove = krait_l2_remove,
> +	.driver = {
> +		.name = "qcom-krait-l2",
> +		.of_match_table = krait_l2_match_table,
> +		.sync_state = icc_sync_state,
> +	},
> +};
> +
> +module_platform_driver(krait_l2_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm Krait L2 scaling driver");
> +MODULE_LICENSE("GPL v2");
