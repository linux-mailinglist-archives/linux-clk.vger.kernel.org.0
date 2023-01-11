Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8AD665815
	for <lists+linux-clk@lfdr.de>; Wed, 11 Jan 2023 10:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238350AbjAKJvG (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 11 Jan 2023 04:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238284AbjAKJtg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 04:49:36 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF20EBE34
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 01:48:28 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id bk16so14419999wrb.11
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 01:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k4e/bFIClwcTBFeT4bkg7MJYA1/OHdeu+1QtASBuUpA=;
        b=yCNGqgnirpDTpOmA9ZMnA71FVuItnXd5NTyRIB4RcKl6FpMMbIvgPc0qrOAIGF2BEo
         ym28MJvtaDewPgjpX0+rodvcVLZelQLUjHsfesTrdhoSMyeOxcXV403RuEoFm8u2Q4tN
         D4YK5Jgg9UYPITFDTxS5wLSjuR/jSo+zyB752B5jukBSo9xp4n62JrjqXRGNcNgs8gf/
         Yo0APw7M8kL/sqx+CYOJ7FpvtoS88KUDkx78WYE+vh4W/E8G38ZkrPD4AkVB7LR4oIEH
         dA0XsZ8o0NYzgdbCtDHWKeW8jAji4eDsQgsVskL/hdAWVLw5mpMXGBhpdHhVOlnXfEqJ
         H3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k4e/bFIClwcTBFeT4bkg7MJYA1/OHdeu+1QtASBuUpA=;
        b=nm9QEawZ6RB8IEksKb7z8t9fSTd0HdKnc3UmGzC04i5OeyZOmK2Lay+3GnSB62LDNI
         bPNJtNnxI1BFw1hPGZtuUjIhPtaH1DxoO5gdLfpXrxrYgAL7eWKHrXJ1qMVda6krMmru
         4NAu3dNNYYnI57PpDCjGCwpL6VyuvK3DubGNaEvXKJP3XB8YWGkOc8C7sp8dYcWhSvQ5
         Rx7gfkP7ttFy9ViIjxaVi4pqODv/s91LghBKw+gzew8IxNCUqRqh51pxEur3xM0qmyBn
         v96XhYQtOLh+UY0DNrihT3P5PVHDERd1m7CEPpWWqjfTpQuZdFvjq1aNESv2+xtmdUej
         F0nA==
X-Gm-Message-State: AFqh2kppt0tmnVuSL1WsuZ1C0MfzTQoFHMR+8Uex/tdBmRD0r9e5U/0G
        3mtcidkOR5Q6eq/e4uumxtbYFQ==
X-Google-Smtp-Source: AMrXdXuAIqa4Yx/QQNnTYGq31pq8ZDb6GToJbV+OAf2qTRr/UFfcFhrwFymZTtQABI2yg3S+/SIoLg==
X-Received: by 2002:a5d:680a:0:b0:2bd:c690:2e66 with SMTP id w10-20020a5d680a000000b002bdc6902e66mr595170wru.5.1673430507469;
        Wed, 11 Jan 2023 01:48:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t19-20020a0560001a5300b002362f6fcaf5sm13289650wry.48.2023.01.11.01.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:48:27 -0800 (PST)
Message-ID: <16b185ae-99a7-61d9-b5a0-f3eb157ea420@linaro.org>
Date:   Wed, 11 Jan 2023 10:48:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 6/7] arm64: dts: Add ipq9574 SoC and AL02 board support
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230110121316.24892-1-quic_devipriy@quicinc.com>
 <20230110121316.24892-7-quic_devipriy@quicinc.com>
 <f6ef1834-b629-b76c-9cde-55af56320665@linaro.org>
In-Reply-To: <f6ef1834-b629-b76c-9cde-55af56320665@linaro.org>
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

On 11/01/2023 10:44, Krzysztof Kozlowski wrote:
> And here
> 
>> +			clock-names = "xo", "iface", "core";
> 
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).

Apologies, wrong template. Correct comment:

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

Best regards,
Krzysztof

