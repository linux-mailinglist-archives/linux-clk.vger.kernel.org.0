Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94BB561A0E8
	for <lists+linux-clk@lfdr.de>; Fri,  4 Nov 2022 20:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiKDTYB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 4 Nov 2022 15:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiKDTXi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 15:23:38 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC3519016
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 12:23:25 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id k4so3676721qkj.8
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 12:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hwx4i8kl3gAwulupSSsSkTjIChny3+b4UG2pCOA9J1M=;
        b=NWihxHTRWa7P5zAWtjlkyg2Vnu7KgSW/DAq99rTTsQv+FWpEqkQHsNv8lD5ZZ9y9Ji
         Q3LOosWuCXo1aT9A+WeLm0twlsu+DUIRj80oG7YCqVA9FHTvbvYsoGMWnm6t7mz+ykBZ
         PnwoHwsgEJTfKvGYfb/SsiQljzmT5hMmKACvnnzY9mYfTepTmoG/TNvyf0w/YEYPn1H8
         Gqa2MLN+Dz+72bDyzEUDjz34yb3vmM6MHFhKiKwYnIPWud5Q3euMqHPzGFrdrOHM/03H
         6C/fBFvQVnUfQkXKhqpIOzOAzjAPnAsoDF7cfmZoMy/a/tEH9AZkr5mJraDURAgp1yrY
         G4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hwx4i8kl3gAwulupSSsSkTjIChny3+b4UG2pCOA9J1M=;
        b=usGCOY5Zgw9+YUf70oEaOB5pAbpRy9wBaJhp48w2dgAxetPw5w5Ddyf6lOHTv96oYp
         UxyB4fBS9bSFRUoU+qb9glRuMemGhzged0QhUinVwn6QWKYIO8c+o5L8ipRagCOcPXjN
         sfBbfF3OaLtSiDlatOW9zj0d5zm3eplA3WihSdLCQ/7thSucX6zWswF8S/10oa8cCTFN
         BQQdourEB3e/T/1SlDlOrQVUGSKVA63l4TNsEZhljv7u3e6nilQNcR/kVD/L5+Wu7oCs
         pvfaBoTffNxeLp2phuuvS5VwIRd6NHbX83oMeJ5+uY781x2fxVXFxkK79o9cmHzASlpq
         bGYw==
X-Gm-Message-State: ACrzQf0alU507kb7RemSo1tELl11O16YMTKgwD/vcZbiXp/nh8usLvsT
        AvsChMM8XJdGiWm3FgGH0erSaA==
X-Google-Smtp-Source: AMsMyM63sQCJoLYWZE5iFa4ctJHidpSzagskhSlfSYHwmkvrA5KnZ60XMwDLlcNcUyRHhD3T6m0MMg==
X-Received: by 2002:a05:620a:404c:b0:6d9:4c49:9d5f with SMTP id i12-20020a05620a404c00b006d94c499d5fmr28032759qko.708.1667589804684;
        Fri, 04 Nov 2022 12:23:24 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id bq8-20020a05622a1c0800b003a4f435e381sm112870qtb.18.2022.11.04.12.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 12:23:23 -0700 (PDT)
Message-ID: <7fe8cb02-be1f-ecac-134d-b78e596d4140@linaro.org>
Date:   Fri, 4 Nov 2022 15:23:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: clock: exynosautov9: fix reference to
 CMU_FSYS1 mmc card clock
To:     Inbaraj <inbaraj.e@samsung.com>, krzysztof.kozlowski@linaro.org,
        s.nawrocki@samsung.com, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, alim.akhtar@samsung.com,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        chanho61.park@samsung.com
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pankaj.dubey@samsung.com
References: <CGME20221104085410epcas5p24d88f59001b739075e9e190e2c47841e@epcas5p2.samsung.com>
 <20221104090019.88387-1-inbaraj.e@samsung.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104090019.88387-1-inbaraj.e@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/11/2022 05:00, Inbaraj wrote:
> Fix reference to CMU_FSYS1 mmc card clock to gout clock instead of dout.
> 
> This fixes make dtbs_check warning as shown below:
> 
> arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: clock-controller@17040000:
> clock-names:2: 'dout_clkcmu_fsys1_mmc_card' was expected
> From schema: /home/inbaraj/mainline/linux/Documentation/devicetree/
> bindings/clock/samsung,exynosautov9-clock.yaml
> 
> Fixes: 4b6ec8d88623 ("dt-bindings: clock: exynosautov9: add schema for cmu_fsys0/1")
> Signed-off-by: Inbaraj <inbaraj.e@samsung.com>

One more comment - is Inbaraj your full legal name? Full name must be
used in From and Sob. Your email address has some additional "e", so I
wonder.

Best regards,
Krzysztof

