Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A817855C15E
	for <lists+linux-clk@lfdr.de>; Tue, 28 Jun 2022 14:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236218AbiF0LgI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 27 Jun 2022 07:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235658AbiF0LfT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 07:35:19 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01950DF15
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 04:31:37 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id eo8so12608021edb.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 04:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5XJdnNIFmfSM/AUDTP3b95/D4h8W2rKRzBttXWD/Lsw=;
        b=bo8ZAAh46LEfGcixBWB/YHsfDf0Z2LUx1aevhy+6lzLTe8jdr+aXhgzjRHATpmqi89
         U74THoM8iqSZlJ8/R9ZE67M4x7rQHWPmeTKRl+uGrAfrX+YX/axlWEUysMuNrVsvkb7k
         o4t0Qug6RV3QLnqSgVXLSKkih9UEZKkcPoQE/ZKxSmoFLzJKiCGNPz/38ckhNp4vb4qg
         3DH7KtkcoxXd4Qcv21tJvbNYKFdFtF8h0eKAw9PBePS2Zc7HT2fmMCuh0UvuwA5yGGk9
         ercvVta48FWxCJGY4rIjvfuSwE/81MCAo9jdywt/SqjTN/XO3slKmUiprQxU8Fp1zgYv
         bb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5XJdnNIFmfSM/AUDTP3b95/D4h8W2rKRzBttXWD/Lsw=;
        b=7VNYqMAa2DKZnPWkelkzDRgAcgnUJZx2Snc3BhGyGQkTEjzjzBPWP9ys9sGydOGT15
         2YuiWIRA55LrviSWLyf5M/+6ngxaHWcXj/SWz+tGmjgrSmhogWo/qL2PP5Rk+qB6toKh
         d9vWOh7YqJI78vyep9LCMaVc+y1ZyZ/NbytCSbj5ZILgTcQcJmjyz3DDJ1NuqF1QdWVX
         eEEIFmraDVKtd7q3+3RkG3Lj0diezHaE70WhEL68n9YzpZQ2rhF70pcQZjh/HDUZhDxS
         uqLDYcv73WzAVsQ4kw6vAvD3IhI/8W+NhWNqRcFMW+iDCC/2dsikvD8SO3P5O92IEh7p
         7KJA==
X-Gm-Message-State: AJIora8VzYpCo/VBjBfMV/sSsWSHAFjAyLawP5naEhdtmgdmCoHHsL4h
        scpM58keq4lP3g8uWTb4kmNAZA==
X-Google-Smtp-Source: AGRyM1vStstN4tUUB/pzR9IKMtXfCs3Qtqs6fnym8dj1SukHVkn0sVV7Z6Tn9Ok5Cep2VNQcSaqA1w==
X-Received: by 2002:a05:6402:1910:b0:435:ccca:1d8c with SMTP id e16-20020a056402191000b00435ccca1d8cmr15866301edz.211.1656329496427;
        Mon, 27 Jun 2022 04:31:36 -0700 (PDT)
Received: from [192.168.0.249] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s15-20020a170906500f00b00722dceb3f8bsm4936671ejj.151.2022.06.27.04.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 04:31:35 -0700 (PDT)
Message-ID: <5f4a8384-2ed4-9e20-d2bd-3a17189b8b4e@linaro.org>
Date:   Mon, 27 Jun 2022 13:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] clk: samsung: exynosautov9: correct register offsets
 of peric0/c1
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220627005210.6473-1-chanho61.park@samsung.com>
 <CGME20220627005413epcas2p452229025b91f81ac86a4ddd403c64765@epcas2p4.samsung.com>
 <20220627005210.6473-4-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627005210.6473-4-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/06/2022 02:52, Chanho Park wrote:
> Some register offsets of peric0 and peric1 cmu blocks need to be
> corrected and re-ordered by numerical order.
> 
> Fixes: f2dd366992d0 ("clk: samsung: exynosautov9: add cmu_peric0 clock support")
> Fixes: b35f27fe73d8 ("clk: samsung: exynosautov9: add cmu_peric1 clock support")
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
