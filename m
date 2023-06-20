Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6842B736387
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jun 2023 08:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbjFTGWL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 20 Jun 2023 02:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbjFTGWK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Jun 2023 02:22:10 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E92EE7E
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 23:22:08 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f766777605so5511932e87.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 23:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687242126; x=1689834126;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AwAquEkYgwoswA9z2TgQn8FMUm7MKaXdx5J6DQ1NGzo=;
        b=Y8YshSWVjxeOtHCCkz6SLzX5DyIyn9e0fvp52/I53DFQcoxqXz6OJ59jIhmqIzBB/8
         ixI585CL9xnliL7wrWLioyl7CyBreQ6ped1kUtaAvnDUagp24W3xcr+Ssp3kzOO1PQbg
         hoZ2QXAVLlNCAe6on5FlhMPasg6VJC3VopO8uweT84KfkyvhqXWx8QwrOcQfnhY/E1qT
         CeGEsuLsNWSCVa5JxXIpYAUoTdMRaXKczR6SDsufP0FEDSGngsDfZef6xLzJ3Rhfp1MZ
         ugRX0dQz+MntmaS/P5HoNVWES7yZ3bBDkKCBDw6/RaveC5O/F/d85yuoxbZUqy7EVLLu
         0dwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687242126; x=1689834126;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AwAquEkYgwoswA9z2TgQn8FMUm7MKaXdx5J6DQ1NGzo=;
        b=ifcnz4yTH/B1EpYB5vwcjNCHdCgWLJ5y6chGqg/wtv4q0fceFQorm0UiRSQdYj56o6
         GS9wJSfTHvaMn9S8ZgBXWhYGIl0LA/XsrwyYnEBCMoH6pZccZNDm3UqqqlDdzvpB78fx
         4cOMps7LjWDT4fzEz1QwVbxGbKh2E7lmh0GE98cQzJ+ZK/2a1ugXitN1F186oqlyxFRy
         Sa0DLHmcQKETGRVRkDtXyLBzP54DhXge5UCqT3V0z83ouJXYipR0qA5tCHNy7lXaiGjs
         i9ztWOjJ/uoyZ9z1ff8YLkhdI0c12WIGYPCL8q9//cto0MAVKaxITtll8sRXjB8GdX28
         cOyQ==
X-Gm-Message-State: AC+VfDzu0hzuk5U3LjfoileDbTFPs9qAj9a+IwjGN4kpZvler8KPKZcw
        8Hi0oTu06axGVP0wBAnDzmon0Q==
X-Google-Smtp-Source: ACHHUZ5zNk8Xk5sFXaqOzp04ZFZ429dXR2gmbQ5/aSYy5CkG5CHLLNfR/ziCfbQZ5pP2BUSy79Emdg==
X-Received: by 2002:a05:6512:1cd:b0:4f6:5653:4470 with SMTP id f13-20020a05651201cd00b004f656534470mr6619790lfp.55.1687242126546;
        Mon, 19 Jun 2023 23:22:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c240900b003f93c450657sm1424502wmp.38.2023.06.19.23.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 23:22:06 -0700 (PDT)
Message-ID: <e847c114-224b-fb69-e2b1-7881b8f8ec90@linaro.org>
Date:   Tue, 20 Jun 2023 08:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v16 1/1] clk: nuvoton: Use clk_parent_data instead and add
 a header file
Content-Language: en-US
To:     Jacky Huang <ychuang570808@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        tmaimon77@gmail.com, catalin.marinas@arm.com, will@kernel.org
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-serial@vger.kernel.org, arnd@arndb.de, soc@kernel.org,
        schung@nuvoton.com, mjchen@nuvoton.com,
        Jacky Huang <ychuang3@nuvoton.com>
References: <20230620015120.234041-1-ychuang570808@gmail.com>
 <20230620015120.234041-2-ychuang570808@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230620015120.234041-2-ychuang570808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/06/2023 03:51, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> 1. Update all parent clock string arrays with clk_parent_data structure,
>    and replace the usage of clk_hw_register_mux() with
>    clk_hw_register_mux_parent_data().
> 2. Introduce the header file clk-ma35d1.h to include shared external
>    functions.

These are two things thus commits.

This is not v16. It's your first version of this patch.

Best regards,
Krzysztof

