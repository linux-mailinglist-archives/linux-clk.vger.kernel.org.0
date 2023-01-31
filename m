Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18D2B6834E1
	for <lists+linux-clk@lfdr.de>; Tue, 31 Jan 2023 19:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjAaSLT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 31 Jan 2023 13:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbjAaSLR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 13:11:17 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6361759259
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 10:10:58 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id o18so5575195wrj.3
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 10:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XR55y+T758WKW/7ql/unBGSUjmS+PjO1DsLN5hn+c+o=;
        b=wFScOlmQ66UJbfUzucCNVBZgKDOEdmOcFlilGIn1btSC/G2bRprLNIue8x0jnWfpbt
         oFc50XFj2PQK9Iv9sM7qxvv554kkDrwRVcZrX4q9M3Zvjc97WLSFskiZc+JKkNHmS0CM
         q08WRr4RieIA0v6CdjyplvgahkQ3giyalU+DH00/qz3xMR7whSo6DcV94FKtUr3yRyg5
         vtSC+pXRJBzX/vm2RlkYDmqmCClvUahWqZpmTl/RGoufCNjhZ+DtP/+xd5Ubx9chNeV/
         EKND1fNe3g/tbfikVj4sSGlBWwvozZCXfVUOq8a3FffclQuIjXrOVWODjmZYw0xs/4n5
         xlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XR55y+T758WKW/7ql/unBGSUjmS+PjO1DsLN5hn+c+o=;
        b=JfGcCq/fkB2HD/SlnwLYdhPs8wdptBaKiEzd/UvoSVwpzmNeeQfYh5WY0pukCQyaaT
         vNZ7dZEs+931foQxosX1AaPUBGk2jBnRebiTMqg41Ux8TWQwg8lfFnOHa07LA0PR2PMB
         Wrh/aOEpMT1XCcy070rrppNBToqwnqTv0Vra0vG/LCRKbv9dObl735TCtCGl4UsS3LWW
         OOVrZVxUdZ8vsHOhLNQGBhHLBd+J932+BHL7Tl95cbOOMT4+EHvjF2izfl79F7UtEt23
         xaicB9hcyXSth+giMqrNwYnmxUlEHPlI3N5wy7zA3lagO2X6lqO/6HZmly+/qvU5i7Cr
         xUNA==
X-Gm-Message-State: AO0yUKUNZmkaCanXuLc4Y3Jkuesl/bxOE/+6aLshdb+HvuI77y10bUGA
        /bVYppcYROsbaqXJylDPRGhTcA==
X-Google-Smtp-Source: AK7set8pyjQr13LRmtmw6G37njqFHvBxv86Suq/59K3GAyNRk+/QqH2Eh7loAx8uRvPhH/wkyo8E0A==
X-Received: by 2002:a5d:64ee:0:b0:2bf:b7e3:7c82 with SMTP id g14-20020a5d64ee000000b002bfb7e37c82mr30857251wri.57.1675188649649;
        Tue, 31 Jan 2023 10:10:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d598f000000b002bdff778d87sm16838246wri.34.2023.01.31.10.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 10:10:49 -0800 (PST)
Message-ID: <67110788-4e9c-8a6b-0b25-ec4e9ee8d494@linaro.org>
Date:   Tue, 31 Jan 2023 19:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V3 0/7] Add minimal boot support for IPQ9574
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230130125528.11509-1-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230130125528.11509-1-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/01/2023 13:55, devi priya wrote:
> The IPQ9574 is Qualcomm's 802.11ax SoC for Routers,
> Gateways and Access Points.
> 
> This series adds minimal board boot support for ipq9574-al02-c7 board
> 
> Posting V3 series, considering the previously posted version as V2
> 
> Changes in V3:
> 	- Rebased on linux-next/master
> 	- Dropped the 'dt-bindings: mmc: sdhci-msm: Document the IPQ9574
> 	  compatible' since it is already part of the linux-next/master
> 	- Detailed change log is added in the respective patches
> 	- V2 can be found at
> 	  https://lore.kernel.org/linux-arm-msm/f81e4605-9111-7f70-abb3-72067d68f8e2@quicinc.com/

This was v1. :)

Best regards,
Krzysztof

