Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCA05B1CCD
	for <lists+linux-clk@lfdr.de>; Thu,  8 Sep 2022 14:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbiIHMXj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 8 Sep 2022 08:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbiIHMX2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2022 08:23:28 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79801228D2
        for <linux-clk@vger.kernel.org>; Thu,  8 Sep 2022 05:23:24 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id y18so4924973ljh.12
        for <linux-clk@vger.kernel.org>; Thu, 08 Sep 2022 05:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=hvgxzlGuIzG2MqoBG7Sa3QM4au7Wi8x97IA3deTkTq0=;
        b=yZFEFLNRBZ3H3hniN1Y9bUuX6gC4Pqlca987YOZMijLUXimumqWzPM21+YgijF7WJf
         zsdZMhyWcY4/ab2gYq5YU4ee7G29zwiddYy5VBnAtE6f/SGqW+8JMstzt5/ySRRwAgr5
         cT+027pbEe75jRXKxnO7wgPkiQxN2CNybTc7hBZHJaxrzt4iuBc7+uQ4eBflxfhYo+F/
         EfielZoCAuretkkZdn+kywDSbYs3hLY0HhXMGl/4ejeY7WoBZYX9ofF3AwIvFj5fnvb7
         gVvomzxgAUuiqKMRX0nhzODLrQ6qVGr4KoGUa/PDDsdlEC9qdRYUxWXinL+OvDd3rNAo
         Ev+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=hvgxzlGuIzG2MqoBG7Sa3QM4au7Wi8x97IA3deTkTq0=;
        b=kMfaVbcHEB08Xfbt6gEAmBA+YqBLEAM9GMJ/DepPqDfJ2ppf2E9z0dNA5vxu7K5GLb
         jBw+MT7MWOHhIqrkbxgMEIUcsdl3DCkeaQlykLA226kV74B+2zpj8wUsk+HqEiM6O2yT
         mUe3zcxwVr2pEPYqGRVreI8RIk9Crw9Yl3M1BvMEuM8npFdRf/hs+hBylc63NQmYXoz1
         v67kfma4qFeHA1k8W286TC3F1nFDDRbs13flwDHqM5kVH7OgpKAQcEXjQe926YacwWeB
         c8GgxxEpwfylBI82kYEmatyNFmZ0bkPePWl+ykUTYf/xZq8SHBlD8PXKlAXdqZY3HS7U
         zpaw==
X-Gm-Message-State: ACgBeo2Hkd1g6xIQj1A/cVvyRlPQrEjvwPmPb0jTtcVYWY5UTiUCxSy5
        aVELoXiewoBAB3hG0tHhX7k6tA==
X-Google-Smtp-Source: AA6agR6BOc7wZHHjRbAadsZfpPD34jJwjYUogQHVztKW5cTADriIdj/Eti1BymJVkh5uuvkLNLM7aw==
X-Received: by 2002:a2e:1503:0:b0:264:e1ed:5a04 with SMTP id s3-20020a2e1503000000b00264e1ed5a04mr2336586ljd.427.1662639802438;
        Thu, 08 Sep 2022 05:23:22 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bj33-20020a2eaaa1000000b00268c58f580fsm3165805ljb.6.2022.09.08.05.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 05:23:21 -0700 (PDT)
Message-ID: <b4625526-8f9b-ada8-f854-751a48545576@linaro.org>
Date:   Thu, 8 Sep 2022 14:23:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 01/13] spi: dt-bindings: atmel,at91rm9200-spi: Add DMA
 related properties
Content-Language: en-US
To:     Sergiu Moga <sergiu.moga@microchip.com>, lee@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, richard.genoud@gmail.com,
        radu_nicolae.pirea@upb.ro, gregkh@linuxfoundation.org,
        broonie@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        jirislaby@kernel.org, admin@hifiphile.com,
        kavyasree.kotagiri@microchip.com, tudor.ambarus@microchip.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220906135511.144725-1-sergiu.moga@microchip.com>
 <20220906135511.144725-2-sergiu.moga@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906135511.144725-2-sergiu.moga@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/09/2022 15:55, Sergiu Moga wrote:
> The DT nodes of the SPI IP's may contain DMA related properties so
> make sure that the binding is able to properly validate those as
> well by making it aware of these optional properties.
> 
> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
