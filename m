Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC954EB0B3
	for <lists+linux-clk@lfdr.de>; Tue, 29 Mar 2022 17:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237567AbiC2PdB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 29 Mar 2022 11:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238839AbiC2Pcq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2022 11:32:46 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB7525E327
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 08:30:34 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id c10so17503223ejs.13
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 08:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9s4lhXjKpwZnBP5OBDO69JPVEpFDyvkrKT28ZSCHe50=;
        b=jDhWGvbg45hFMUc2H7L/PyMkYepJE8Brw9CTox76BJp6yPuVDBNvo5TZrS4eMek5wM
         pfF+gywAT7TFWN+4+Cdf1eifEK1m3Nx9NdlETbTn7GgWzKR94JYAG2cXI0DNc3OcR9Nd
         a6ZrUtyti5au1h8RnTM6R+4PgBaUbg3YdBQGPnn3CFd8x+6zA8NzLLBfoI6lX/CLAKJI
         lqk4JxyM6at65/JWMnEmDXl71Orl4KqnbVNzDDsMd8eZEUUkhHp/Rjwt4J0YhOqLzTMI
         HW9g8uZw7x7xTBDfheGd8qZlGxL6SK1cBCI8L/80jGmpbePGZBxplREsBaJPUJFdqZix
         ynNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9s4lhXjKpwZnBP5OBDO69JPVEpFDyvkrKT28ZSCHe50=;
        b=Rg2y8KI1rPyFuRw+QBIsB3tnqq+K/DaB4f68L2tuVVQWAyI6l1vRwrSlIE5IxGDOWh
         FEFdTs2PevK7jsM68cEsnP3NDv9aRSw43CO9pmp/yk506fXqivlssEPA2W9c5MZgRUD6
         t0TTiYQE3n7Hkb1LR+kjBPiKqvuBUerVlqM0uabWMG9pR2MKhFUYCjxpjMo4fgBNvjls
         PNsdwhLxUQM9WHAoNa4l213/4lqERmw1ehnl/FJObdDd5CuQO3bIbqYGLAxoECY/vDN0
         lcgqppIG/NnwB3rWoyPF0n+uBsW8Bp9HpFE+P48wiZbENMkbko9gleY/6Bz6clBj9eBz
         Z2OA==
X-Gm-Message-State: AOAM5331Mcg/XLmwCXcT8cz1im9t9h8wU1nyRJK1xoulj4soCe8G4woY
        iVOPZIkNYzKfo/b1OUJrs8JxzGo+X++/mWDg
X-Google-Smtp-Source: ABdhPJyggpvt+L2mf4BO89ncYH14tsLLTo3h13rFb/YMGVlS4Lafq4DYQ0pjj0PQ8J9clwYcURhZ2Q==
X-Received: by 2002:a17:906:dc8f:b0:6e0:5ce7:d80e with SMTP id cs15-20020a170906dc8f00b006e05ce7d80emr35826397ejc.435.1648567833374;
        Tue, 29 Mar 2022 08:30:33 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id o3-20020aa7dd43000000b00419db53ae65sm3024996edw.7.2022.03.29.08.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 08:30:32 -0700 (PDT)
Message-ID: <7f3d8d2c-ec83-b79d-621c-312636285eee@linaro.org>
Date:   Tue, 29 Mar 2022 17:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/6] dt-bindings: clock: fix rk3399 cru clock issues
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220329150742.22093-1-jbx6244@gmail.com>
 <20220329150742.22093-4-jbx6244@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220329150742.22093-4-jbx6244@gmail.com>
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

On 29/03/2022 17:07, Johan Jonker wrote:
> The current rk3399 cru DT node gives warnings like:
> 'clocks' is a dependency of 'assigned-clocks'.
> 
> With the YAML conversion somehow "assigned-xxx" properties where added.
> If a proper clock is added to the cru node these properties are no longer
> needed, so removed them. Currently only one clock will be added, so limit
> the clock maxItems to 1. Add a clock name to be able to differentiate
> and filter bogus entries.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../bindings/clock/rockchip,rk3399-cru.yaml       | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
