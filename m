Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31340760C93
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jul 2023 10:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbjGYICh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 25 Jul 2023 04:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbjGYICg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jul 2023 04:02:36 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E13120
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 01:02:32 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so42465105e9.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 01:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690272151; x=1690876951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I3v1BVqEhAVeW2Xqs0OD6SXxWEo7Q/+yKV1QI3AwLLc=;
        b=aaouEtYVEjE4zRDsvpzoWGwzwSPV9SDD1pdljgK9gA6Ri9rLr2Jtspbzv88hJH6cwe
         AVZnBOkQavqOPMfV6TY3c9I04noNBrNguGJwH3S2e/Obw9vzkgwiDWRKRQ4oR0YHJ/j/
         cT2fBeH8JuNBmwaribj7aGrIcV333QfISME4Q8HbQSxwlj1pfHisUfDLtDt270Z7YDqS
         +vRtDUw+up8/afHH4b5AjRJ6k4xDZGR//8ifsJiCtsEZ1Ha1MHpnYS0KORtR4oJ49Vic
         Gp/qRnAxs/b/TgS/xX+QN5bBIYIGnIAKizuPJp89fVG002GPkmH2CZkkonoMcyOIvkdm
         +12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690272151; x=1690876951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3v1BVqEhAVeW2Xqs0OD6SXxWEo7Q/+yKV1QI3AwLLc=;
        b=Achw8NJI0HTS3bn18HDE1JsjiUNJlGlQ+0kh1aRGSdbNtOUYjWFLwiN0p/4jawye0M
         xfiIEIJynT9pU7XOcdaqxOx3tXKY6qpdrhg8qxcAotxCTpA42EnElQibaOlyHUDPhxOL
         bSv6HCiF+yfS+Q93OCAD65S3PyyS9+LFDFCWiHDi7KFkTLIEmHwbgD9boUxTniG5VoTU
         zQ5M4zbOBQnTSmSTndv3gDkMhsesB3f9QIwG2I2ltUn77omz4GM5S9s3tQ/hq/sU8qV6
         oj4rg5YUO5ZLk6Nw5bfWvWRHnE1ceOAqv0BmUhqpA69JGRdePfVH8Ux8Ntqo6WePYANQ
         QnXA==
X-Gm-Message-State: ABy/qLZBIdux1owgSBtNEtJVwsr9bEA3zJIiXR0tC0Nygd4bN7+72nf/
        wFqWKkIU3wVeNylt/SaUmKuhVg==
X-Google-Smtp-Source: APBJJlFyrzW0659tWRjxTEp4UbibdlARF8lOgeGhcIJ5aGAk4vGcxVsE/S/rge44cR0Qz14H3wkvxg==
X-Received: by 2002:adf:ec86:0:b0:317:67bf:337f with SMTP id z6-20020adfec86000000b0031767bf337fmr1758860wrn.2.1690272151075;
        Tue, 25 Jul 2023 01:02:31 -0700 (PDT)
Received: from [192.168.1.101] (abxj221.neoplus.adsl.tpnet.pl. [83.9.3.221])
        by smtp.gmail.com with ESMTPSA id x12-20020a5d650c000000b003143aa0ca8asm15394656wru.13.2023.07.25.01.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 01:02:30 -0700 (PDT)
Message-ID: <411da19f-10f3-6dc1-a708-cdf06be9c4d8@linaro.org>
Date:   Tue, 25 Jul 2023 10:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] clk: qcom: hfpll: Add MSM8976 PLL data
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230723160827.22660-1-a39.skl@gmail.com>
 <20230723160827.22660-6-a39.skl@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230723160827.22660-6-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23.07.2023 18:08, Adam Skladowski wrote:
> Add PLL configuration for MSM8976 SoC, this SoC offers 3 HFPLL.
> Small cluster offers two presets for 652-902Mhz range and 902Mhz-1.47Ghz.
> For simplicity only add second range as smaller frequencies can be obtained
> via apcs divider or safe parent this also saves us
> a hassle of reconfiguring VCO bit and config_val.
> A72 and CCI cluster only use single frequency range with their
> outputs/post_dividers/vco_bits being static.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
[...]

> +static const struct hfpll_data msm8976_a72 = {
> +	.mode_reg = 0x00,
> +	.l_reg = 0x04,
> +	.m_reg = 0x08,
> +	.n_reg = 0x0c,
> +	.user_reg = 0x10,
> +	.config_reg = 0x14,
> +	.config_val = 0x4e0405d,
> +	.status_reg = 0x1c,
> +	.lock_bit = 16,
> +
> +	.l_val = 0x3e,
> +	.user_val = 0x100109,
> +	.min_rate = 940800000UL,
> +	.max_rate = 1843200000UL,
2016000000?

[...]

>  static const struct of_device_id qcom_hfpll_match_table[] = {
>  	{ .compatible = "qcom,hfpll", &hdata },
> +	{ .compatible = "qcom,msm8976-hfpll-a53", &msm8976_a53 },
> +	{ .compatible = "qcom,msm8976-hfpll-a72", &msm8976_a72 },
> +	{ .compatible = "qcom,msm8976-hfpll-cci", &msm8976_cci },
.data = is missing

Konrad
