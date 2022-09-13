Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 115C45B73A2
	for <lists+linux-clk@lfdr.de>; Tue, 13 Sep 2022 17:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbiIMPJc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 13 Sep 2022 11:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235524AbiIMPIj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 11:08:39 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A17A760FE
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 07:31:08 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id k9so21155725wri.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=98b3ViV0sOxY601CxqpC7jH63smaiD0oF4bKw9dMEOU=;
        b=x63sDMCcfZTy1D748IyJ5aIRfCyPzNArlDP0lV9hvY4+cWUdRbyGcVG6xrdDRre/wu
         OK58fX8B9uI58ozCYyzfgATB4Rdq2rJik1QNvT01pZlRndkJ7W/smi2v5UEkVJCJJpMa
         /UjP5jhzzQUt/3TQ1vnKejcSVqf6wAm8KqerKf1MwIz7CIhvIo0h/3JcJeGM09YkqRrM
         JCz4zmvgYmgkI0MxrpHEOWKJjtiZjZNZQMe0OdoWeKlk3V7WARO0cSXoS+jwgdnjnS/y
         Hmu7TrqgUjhUSWEwHLc8llAeqrkWMx8Xsa6pAvK076PPomcN0/DoT6ceK/jSnulzUi5Z
         aqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=98b3ViV0sOxY601CxqpC7jH63smaiD0oF4bKw9dMEOU=;
        b=6kl9LUqRNE4pe+40VnWCmi5b4kgsa93XzmsUxcEIRsFe97LkEl6XbsreLtjfhS+UE8
         vjOAo7XW6fBhgvwxUMjSVsaC4/I5C+RZaj5ivLtUUD/dgOEVshSJYs63JUWAJn2sMEKg
         rO1OnopycW8EboQs8PYmUkv8klVIpJiIX2S94Rui/QjEQQb7cSqZ7Vtg+se80sZTrEym
         EB5AvTt6Iu25tThxRpL6CN7fm5BmGRLgW8y4B/oyHW3TNv7EF9dkDOBm4Cdt4/3nFGZ9
         DFa9v34HYZ9e+wK8pUxhveh+LhXAFYdjMRcR2let13XODTYVt/P6UlFVxWRT3EctBGIM
         bNAg==
X-Gm-Message-State: ACgBeo2iIzViip8qiFFqbW+Eqa703VveRJpyLssZFHiIKBJihCZk6omG
        sVHLFgVBOFpaL7GvAE4oWPCRaA==
X-Google-Smtp-Source: AA6agR50vZb8xTosW20EeX8oWSBviovENhMmwWYTaHu44Hk9vz9gqIKhodf+GxHuJX6NHOObWD9U4w==
X-Received: by 2002:a5d:550e:0:b0:228:da13:952c with SMTP id b14-20020a5d550e000000b00228da13952cmr18908046wrv.694.1663079400099;
        Tue, 13 Sep 2022 07:30:00 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.67])
        by smtp.gmail.com with ESMTPSA id t3-20020a1c4603000000b003a5c244fc13sm13971234wma.2.2022.09.13.07.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 07:29:59 -0700 (PDT)
Message-ID: <fd42b847-0dcb-e116-a1bd-48e68161333f@linaro.org>
Date:   Tue, 13 Sep 2022 16:29:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 09/14] dt-bindings: serial: atmel,at91-usart: Add gclk
 as a possible USART clock
Content-Language: en-US
To:     Sergiu Moga <sergiu.moga@microchip.com>, lee@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, gregkh@linuxfoundation.org,
        broonie@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        jirislaby@kernel.org, admin@hifiphile.com,
        kavyasree.kotagiri@microchip.com, tudor.ambarus@microchip.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220913142205.162399-1-sergiu.moga@microchip.com>
 <20220913142205.162399-10-sergiu.moga@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220913142205.162399-10-sergiu.moga@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/09/2022 16:22, Sergiu Moga wrote:
> The Devicetree nodes for FLEXCOM's USART can also have an alternative
> clock source for the baudrate generator (other than the peripheral
> clock), namely the Generick Clock. Thus make the binding aware of
> this clock that someone may place in the clock related
> properties of the USART node.
> 
> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
