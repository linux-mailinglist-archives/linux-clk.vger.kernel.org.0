Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B946A25FF53
	for <lists+linux-clk@lfdr.de>; Mon,  7 Sep 2020 18:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbgIGQae (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 7 Sep 2020 12:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729847AbgIGOZv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Sep 2020 10:25:51 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FABBC061795
        for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2020 07:25:49 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c2so16302233ljj.12
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2020 07:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hVM3Bwa+7CBJ1tm/Y8nBpr8saRwPz4svplyjBBrsC0U=;
        b=uOj4oOeWuxxaOC3HiEmLRokBFD2dg7nD1Pl4YXtz7g4VAxKf1FMy8miJkKwkZe9LAT
         xzxye6K/Bk5OHtZ98rqpxm/YaCQhrhfulRoJoealMpHCYsSDKPrIjL782JpI792BfNJH
         Z1bxAJ9YP/+aZEbgwAV2/NM2D0sewEHFqEn1d5hL15DZyck5+AH5kuNPqDFtqobndW4q
         kqcRMHkAMintNj6zTEb+qQKL1supzKdRvXIYPA64AJL+dKfCvgfdARuLodImftyU/JcB
         d+u9lJqZiw8hXMILJNLkpJ/kAPeTFBR37LGdQA16PFdzc6KrD5Rft9Z6D8+Oj6Ja/5uS
         TIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hVM3Bwa+7CBJ1tm/Y8nBpr8saRwPz4svplyjBBrsC0U=;
        b=e+Q0QcMmpmpKxbp1t8Vowxs6zbrzYhQcdIukJZXPJKyl9OGNzB0A2PzNtZoXiSFXwe
         k3EOAIh3rwh1cxuXPhCgl87ZXvJN1EDgjFoBt8cfr+xdToXoe/iOd1o2n6j33V5z0ddT
         ywF+8l05qzZoWDEqPeaxQqQKzZ/CQ7Nx//9oRn7F3yqza8lkqip7BZJw4BSo+kOz+Wxs
         7L10rORBXPbSG7xK42CPML3SA46v8spMEdbGZNZgw1OWnx2wq7+Rs7UqBfHa/MPbfmV9
         JLfhN2zukd0O0cAnsVhyYF9O2YSxG+GVyqe8ed1MA/0KvSUj9QwEdV1C26rR3aqhbM2c
         c+mQ==
X-Gm-Message-State: AOAM533YQ+XvaWmIWUZw+mhzI7K7f/NR2JRydMPqK76ha6pTXbTSUXcq
        G5mXzoyEMnkdBHZ0WH6h+smJtA==
X-Google-Smtp-Source: ABdhPJygP+SYAnnRaMnSoWu4qiJ84OSHZbWcft2WovB1SA5iKRJc85ubCtTQ2w1xI5K+uszGHMBeCg==
X-Received: by 2002:a2e:7e12:: with SMTP id z18mr9706298ljc.388.1599488748047;
        Mon, 07 Sep 2020 07:25:48 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.144])
        by smtp.gmail.com with ESMTPSA id f25sm5577940ljn.29.2020.09.07.07.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 07:25:47 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] SM8150 and SM8250 dispcc drivers
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
References: <20200903222620.27448-1-jonathan@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <fd5fbe73-e2a5-d877-743c-ad7cc6110483@linaro.org>
Date:   Mon, 7 Sep 2020 17:25:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200903222620.27448-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/09/2020 01:26, Jonathan Marek wrote:
> Add display clock drivers required to get DSI and DP displays working on
> SM8150 and SM8250 SoCs.
> 
> Derived from downstream drivers. Notable changes compared to downstream:
>   - EDP clks removed (nothing uses these even in downstream it seems)
>   - freq_tbl values for dp_link clk is in Hz and not kHz


On SM8250:
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> v2:
>   - updated dts example to reflect the change (first patch)
>   - updated config_ctl_hi1_val in sm8250 dispcc to latest downstream
> 
> Jonathan Marek (7):
>    dt-bindings: clock: sdm845-dispcc: same name for dp_phy clocks as
>      sc7180
>    arm64: dts: qcom: sdm845-dispcc: same name for dp_phy clocks as sc7180
>    dt-bindings: clock: combine qcom,sdm845-dispcc and qcom,sc7180-dispcc
>    dt-bindings: clock: Introduce QCOM SM8150 display clock bindings
>    dt-bindings: clock: Introduce QCOM SM8250 display clock bindings
>    clk: qcom: Add display clock controller driver for SM8150
>    clk: qcom: Add display clock controller driver for SM8250
> 
>   ...om,sdm845-dispcc.yaml => qcom,dispcc.yaml} |   30 +-
>   .../bindings/clock/qcom,sc7180-dispcc.yaml    |   86 --
>   arch/arm64/boot/dts/qcom/sdm845.dtsi          |    4 +-
>   drivers/clk/qcom/Kconfig                      |   18 +
>   drivers/clk/qcom/Makefile                     |    2 +
>   drivers/clk/qcom/dispcc-sm8150.c              | 1152 +++++++++++++++++
>   drivers/clk/qcom/dispcc-sm8250.c              | 1100 ++++++++++++++++
>   .../dt-bindings/clock/qcom,dispcc-sm8150.h    |   69 +
>   .../dt-bindings/clock/qcom,dispcc-sm8250.h    |   66 +
>   9 files changed, 2428 insertions(+), 99 deletions(-)
>   rename Documentation/devicetree/bindings/clock/{qcom,sdm845-dispcc.yaml => qcom,dispcc.yaml} (75%)
>   delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-dispcc.yaml
>   create mode 100644 drivers/clk/qcom/dispcc-sm8150.c
>   create mode 100644 drivers/clk/qcom/dispcc-sm8250.c
>   create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8150.h
>   create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8250.h
> 


-- 
With best wishes
Dmitry
