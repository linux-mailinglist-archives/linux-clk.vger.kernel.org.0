Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F62A6945AE
	for <lists+linux-clk@lfdr.de>; Mon, 13 Feb 2023 13:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbjBMMU3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 13 Feb 2023 07:20:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbjBMMU2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 07:20:28 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866CB901D
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 04:20:27 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id by3so10669389wrb.10
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 04:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1RUiDD3BHhlqCpOjKjv9whKB2P06JmlcSFZbd1kJnhM=;
        b=KhuztlcTg/PMm11aZvBlHcjpnHotQ9xLJ0zvA3pdempjme4Cs9VrJ39GH/ZONlRhOZ
         YGn2xod2W6mNkXqUbxLTAgm9yl/vnbk9tr0HoSt2+szHVad7q3fC3JORUEzQlwV3R2zz
         NwY+Yb+V7MHbDwg8YLg5Ut1gQ3CNyn1Povpw3MaGNMnw/joRIOylGnAnAWHRamvRmUKn
         IQh0Uiint3viHFDkBgmV8k4pXle1gJVvRFKPSVNJMssvu5u2Iz+Yzqyv2nfVmFmBgHdn
         PRc2aK3ynQJIG4lGPW5MsXrXmfajX9t/R3YL/IGR78FVs4NGmbbpsMzRW/fw9krJqrCa
         DVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1RUiDD3BHhlqCpOjKjv9whKB2P06JmlcSFZbd1kJnhM=;
        b=1MndfnxOFrAvYkyXipkTHTu2a8KYQ1qeFd2V2saNsJ6ITBOc4uJt0a5TGdzr/PMY3n
         k5ILvipEINfZ+rTaqkrOqIlVwK7TCiuI6QkrXYT0r66q1HxAaF+bKbqwSmIJvGe/0wPS
         bIg3AmnbHalzpgiUEKfYppd35TH1VjWoHnN9QVpsuIp1LnozSAvEuBqq32THGoTnq+/V
         pTc3lzTYPqln7qUt7WR+RQL2b+wy7t+dgbidHNCiOv3v0TP3or5pgaUfExqtzMgsbxZu
         9j6qTIrgdN8K7DbziS862tInOFWtdnVk1k6JPH+FNTZwBFpDHE5ZmbQ+bEuYFc0cXSeW
         rw5w==
X-Gm-Message-State: AO0yUKUvdQcKADMHW6xe9rkAibNnu7bAsI3ToMjt17mMxUwg/JH6YjmY
        Pp0xTDNxMgb5kgW3HixzCLgKrA==
X-Google-Smtp-Source: AK7set89FkNhiCPxpnkK76tQM5xvvbrWbUVea99QXLeZbhluUfzetqGrin/ar/FHc4nSnKUMHRV/Fw==
X-Received: by 2002:a5d:624a:0:b0:2c3:f8b8:87 with SMTP id m10-20020a5d624a000000b002c3f8b80087mr18069188wrv.25.1676290826133;
        Mon, 13 Feb 2023 04:20:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l22-20020a05600c089600b003dc59081603sm12856722wmp.48.2023.02.13.04.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 04:20:25 -0800 (PST)
Message-ID: <4e13868d-4263-9e30-e832-6dff25900fce@linaro.org>
Date:   Mon, 13 Feb 2023 13:20:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 1/5] dt-bindings: clock: qcom,sc7280-lpasscc: Add
 qcom,adsp-pil-mode property
Content-Language: en-US
To:     Mohammad Rafi Shaik <quic_mohs@quicinc.com>, swboyd@chromium.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
        quic_plai@quicinc.com, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        quic_visr@quicinc.com
Cc:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
References: <20230213094528.3733509-1-quic_mohs@quicinc.com>
 <20230213094528.3733509-2-quic_mohs@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230213094528.3733509-2-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/02/2023 10:45, Mohammad Rafi Shaik wrote:
> From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> 
> When this property is set, the remoteproc is used to boot the
> LPASS and therefore qdsp6ss clocks would be used to bring LPASS
> out of reset, hence they are directly controlled by the remoteproc.
> 
> This is a cleanup done to handle overlap of regmap of lpasscc
> and adsp remoteproc blocks.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>

SoB chain looks not correct. Your should be after Srinivasa.



Best regards,
Krzysztof

