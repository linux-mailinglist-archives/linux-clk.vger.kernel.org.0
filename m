Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 415A27D657B
	for <lists+linux-clk@lfdr.de>; Wed, 25 Oct 2023 10:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234111AbjJYInY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 25 Oct 2023 04:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232807AbjJYInY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 04:43:24 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61F8B0
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 01:43:21 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507cd62472dso727309e87.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 01:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698223400; x=1698828200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbLrXjBZXO+3rnUIjlVT/ww0YCi+1hft+XaLG33lx2o=;
        b=Mb3c9zlREbnhbaMnJvoP6riky0KyBsKEFuLU85e1uYhpXn+2bA7akhCD/tNJQ8Hcdk
         TLxoODt9AatDDhuK4WEW4hJ0n6LiizjZ5HDyCV4bDsmpcXZ5vA7YJzKut2P1DGitYZ+r
         /XI/E1ybzHOqv1ReGx7d2va6a0COvxI2TuF1H+nv3D+wKSa2vTqgKbnmBLqveJZcOZoN
         0k7ndc887GRc5GIRO2NMTwRrSLyEFZTx/lD+qe/V/ghZs8QQ+2PjuthEECdUJgcU37wt
         GB0TZCbrWIytCjaF/zotSCIQ9uq4aC5iXe/c6/sBMG8QnXfsxCjv8S9dDltZZkN4kriQ
         jNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698223400; x=1698828200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbLrXjBZXO+3rnUIjlVT/ww0YCi+1hft+XaLG33lx2o=;
        b=HhSpy/pO2ReFVn7bhYhUkKAKtcs5C0byz4RVOTTJWU66yY97qb9Q99TUq5MTsM7FFx
         3KQFIaGVlELXCeP3DZ2nO+aDCKNvJZ5aNVCvedpYGO5cXlF09hv53rQ96TTIq3Y5I92J
         BXfJVcoFuiLKK6WyMBQ1IPAFJIPg+o2Y65rVE9TTRRe+BAWCOURNModbzhZeQh59CMcX
         kfR3i/LRtlW3jzOAAw4xCok+r2SOB1MFPeG1kSHi8dPVT0QHRuYOELU5gFAM+r8WNvn5
         FjN7Vh/YsKcTzEAJhFdMwJujdlylUM9LPrl7uMcQnv9Qk+gU0CfrGKBj5wGHTPizeFIa
         2GrQ==
X-Gm-Message-State: AOJu0YzP9w2f+ykEn4Rv7PrYO05w+/ccrLuaVitm77gvlm0gSPKIShbd
        cw3ckJ8zW0ONR2YW3Dcc79UXSA==
X-Google-Smtp-Source: AGHT+IEjC9Ga1pWJ9JCoPsNumAlAtpl1XkhctgTpX8WDk3zx7MGDnwcD7bo66SBnpwb8RDdyBGo5Bw==
X-Received: by 2002:a05:6512:1287:b0:507:cfcf:d3ce with SMTP id u7-20020a056512128700b00507cfcfd3cemr5556653lfs.12.1698223400115;
        Wed, 25 Oct 2023 01:43:20 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id v17-20020ac258f1000000b005056fb1d6fbsm2449489lfo.238.2023.10.25.01.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 01:43:19 -0700 (PDT)
Message-ID: <c9aa685b-b746-4901-a374-4e9d4d5b6cfb@linaro.org>
Date:   Wed, 25 Oct 2023 10:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] clk: qcom: add the SM8650 TCSR Clock Controller
 driver
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231025-topic-sm8650-upstream-clocks-v1-0-c89b59594caf@linaro.org>
 <20231025-topic-sm8650-upstream-clocks-v1-7-c89b59594caf@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-clocks-v1-7-c89b59594caf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/25/23 09:32, Neil Armstrong wrote:
> Add TCSR Clock Controller support for SM8650 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
[...]

> +static int tcsr_cc_sm8650_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &tcsr_cc_sm8650_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return qcom_cc_really_probe(pdev, &tcsr_cc_sm8650_desc, regmap);
qcom_cc_probe?

Konrad
