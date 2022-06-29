Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E39A255FDC9
	for <lists+linux-clk@lfdr.de>; Wed, 29 Jun 2022 12:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbiF2Ktn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 Jun 2022 06:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbiF2Ktn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 06:49:43 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D061E3FA
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 03:49:42 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id c13so21583756eds.10
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 03:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QCnND+Ihr0E4grOsKhhsVTMtV8dOmEKSL8p2O7AW2mo=;
        b=yNq8IvCL5Dg51Uk7RRycS5nTQ1ufinsu06YZxbJrtwMe2AdvrQ8y2tWiPzSnzQDxJt
         g6JYm2ol8XeEKknqc5daQfBgei7nO5Rzo+vxg07UEgvs3x6ZAv/6N/Kc2ez2Ut9ah4yX
         25qAwKWwtCYvUkkhMVtHu1U3apXjGaBVplRwyx49+bv0uh8zhQRjKwsVlDpcJnAIuiIi
         P7nX40urc34Noz/c7SArlRjxDpAnsbiJA4gJBJ2bF0BmsojoVIghTJjTtWmIBIvFOx2Y
         3OUgAeAQaYSi9d3tkhF0AN6+nteGOdUB3hGv1LeMIx/XZJty7ZDLCcZQCBsco7/5eX8Q
         Cylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QCnND+Ihr0E4grOsKhhsVTMtV8dOmEKSL8p2O7AW2mo=;
        b=o3t2Nd2OxOcFlZZ5rW91IM38zCCBfRXQYicvjYwMSvR7L1szV2vyet1MrwKErHwiPy
         HUcZeEoW5DM+XPjZjCqpIXoXZQpLOJH7e/61FVy58cbZ679YTB+PoRJKvrgQNyLaratr
         I4GSrJHdJ3tsdlN+oizcRJafsKvlZA4owe6LfkK3CisJwpzCvC2Y3UPYGRtN4A5xQ7iy
         SqFJI3YL6uP5sMLt60q3i99xeTPvdOnN4kVdRAmIT1UdgkdCeotQsfJWUtqEvMJo6Kqt
         RrSLQ97z55roXwddd3649iJTPOaZot26iq532R7EyQt9x5azRZbc62xjw+8eNyMqZ6Aj
         XK9g==
X-Gm-Message-State: AJIora/+m+umpZgrCW2QOoy2swRZHzUOpoJF3hMnWK1kDWgTejbNqkwL
        LAkeoRnFJ3wQU5QWjUF4UDiLgg==
X-Google-Smtp-Source: AGRyM1vPhtigeGlEU1LfGq5MzvjkEe9jkqsKuNcP6bcK5KLfAijl6m0zJULiQcNe8NSdk7w+UspYZg==
X-Received: by 2002:a05:6402:d05:b0:425:b7ab:776e with SMTP id eb5-20020a0564020d0500b00425b7ab776emr3460224edb.142.1656499780597;
        Wed, 29 Jun 2022 03:49:40 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s16-20020a170906455000b00722bc0aa9e3sm1300091ejq.162.2022.06.29.03.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 03:49:40 -0700 (PDT)
Message-ID: <75bc2de0-1965-ed64-7313-ccf9a88a64c2@linaro.org>
Date:   Wed, 29 Jun 2022 12:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 2/7] dt-bindings: clock: Add MediaTek Helio X10 MT6795
 clock bindings
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, robh+dt@kernel.org
Cc:     krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        y.oudjana@protonmail.com, jason-jh.lin@mediatek.com,
        ck.hu@mediatek.com, fparent@baylibre.com, rex-bc.chen@mediatek.com,
        tinghan.shen@mediatek.com, chun-jie.chen@mediatek.com,
        weiyi.lu@mediatek.com, ikjn@chromium.org, miles.chen@mediatek.com,
        sam.shih@mediatek.com, wenst@chromium.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        kernel@collabora.com, Rob Herring <robh@kernel.org>
References: <20220627085632.23797-1-angelogioacchino.delregno@collabora.com>
 <20220627085632.23797-3-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627085632.23797-3-angelogioacchino.delregno@collabora.com>
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

On 27/06/2022 10:56, AngeloGioacchino Del Regno wrote:
> Add the bindings for MT6795's clock controller.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  include/dt-bindings/clock/mt6795-clk.h | 275 +++++++++++++++++++++++++
>  1 file changed, 275 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt6795-clk.h

The same as v3 - you still need vendor prefix.

Best regards,
Krzysztof
