Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D405583A2B
	for <lists+linux-clk@lfdr.de>; Thu, 28 Jul 2022 10:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235082AbiG1IRt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 28 Jul 2022 04:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234950AbiG1IRs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jul 2022 04:17:48 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EF561DA8
        for <linux-clk@vger.kernel.org>; Thu, 28 Jul 2022 01:17:44 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id b21so1152020ljk.8
        for <linux-clk@vger.kernel.org>; Thu, 28 Jul 2022 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7Rf45d35Odvx4RRIYeKWOyJLAziqkTwb8otII4FltA4=;
        b=xIldjVlybxEjNKgdIw/vCDkTBIuMrfPWSoOnpW7cKZcmmSsh32e3xvfza9rxHtX3jR
         kykvMw1w8Dif8fRi1l9edEmSYto+pzkvtIyuRdUY86P44u9cuBego9KFqg+I6mV17ToM
         KhWeo8/v1rQhdgaspxHCwNpIvCVR0MkyMN/aKIoKt9ae0chmAAM+WN0bbbDEH9Jrvvy0
         I2bt9M0lxRrF95DLfYEtc/QrTJO8l4k9wPtFzcJksRnNWkkMrM4NaPiCFAQK4G6vda0Y
         JqEPIqDFq/atrNtvNQl5MAHqEXmeEAS6H9XI2a1b6YyIW0NJIbL+mQlNDVBr2yxG4ocq
         YE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7Rf45d35Odvx4RRIYeKWOyJLAziqkTwb8otII4FltA4=;
        b=bfbV7WXhUjQtMp5qJYGs7EKYsliULNCrltBQGRhOlxj0ugIeLAAc7u2yOYJYnnR6zd
         7L7kKHSxrKnaHLIbB4uzIEoSXe2sYLBS47KAThR4muZNEnYmgkcTG2z4uVp7EbOcXm26
         nPUGBcbzm4JlG6+xrra6NSVRIGKiug5PI9hHYK1dYnYYXfLRgNBMK1nGwqm7qQcj7imo
         PYrr51UyVPt1NV+U0u03lkEi+ZGSPwjbFuOezYxk03Nenbc6sQolFohAaFTxnPB5Hwfq
         ZhZIG18AOBFAKtTZQtYPWQwXbda/7X3Mzsff+KTSnCJ+E7Uagdx0p0RVoj/xvU6UpihL
         Pk7Q==
X-Gm-Message-State: AJIora/gPFYg97+cTjN7T37rMcSQYJP7pxXD7xfBhPESvTphTPpGOxKR
        sRsNQsJMRMiZGw80FpddUVS1EQ==
X-Google-Smtp-Source: AGRyM1tJFlJPLFUpTkeIev6iKmTznXe90a0put6K1iBfwuk/Uo0tDpwOeL9e7gLB5jCvWVZCstoArA==
X-Received: by 2002:a2e:b70e:0:b0:25e:2caa:6cdc with SMTP id j14-20020a2eb70e000000b0025e2caa6cdcmr535051ljo.492.1658996262663;
        Thu, 28 Jul 2022 01:17:42 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id o14-20020a2e944e000000b0025dde220a94sm2477ljh.109.2022.07.28.01.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 01:17:42 -0700 (PDT)
Message-ID: <cd2f46c5-b2aa-b85c-9efd-55426d191421@linaro.org>
Date:   Thu, 28 Jul 2022 10:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/6] dt-bindings: clk: exynosautov9: add fys0 clock
 definitions
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220727060146.9228-1-chanho61.park@samsung.com>
 <CGME20220727060612epcas2p355e7f9ca3700cad4778e944cbdbf2d50@epcas2p3.samsung.com>
 <20220727060146.9228-2-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220727060146.9228-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/07/2022 08:01, Chanho Park wrote:
> Add fsys0(for PCIe) clock definitions.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
