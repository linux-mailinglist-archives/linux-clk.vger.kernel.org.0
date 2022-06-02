Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECDD153B84F
	for <lists+linux-clk@lfdr.de>; Thu,  2 Jun 2022 13:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233781AbiFBLzT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 2 Jun 2022 07:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234637AbiFBLzH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Jun 2022 07:55:07 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E76C15897E
        for <linux-clk@vger.kernel.org>; Thu,  2 Jun 2022 04:55:05 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id fu3so8005114ejc.7
        for <linux-clk@vger.kernel.org>; Thu, 02 Jun 2022 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GnEcVvfjc0afaecD6p4iJbtQNdfaHZzq5qCa8RK3128=;
        b=S2KS9ndGDFQ8VE+mEnfO8aOw1H3EWNLvBDSilL/bsoVvSd0Aq1kKjkdvcSNJDPaAIG
         k/qC4j/d5B0ljCv1YPcqsDS8ECt6YfRKpaIsh/+6DpPKSyyZvcH8nCNvdD+ABnsx96fX
         7QhZWvqpZWIeQXQLDXhcrvzqieGEwvgo3zejM/8VEVmPz9q4EXnMkcb9V7cCOpCyoeAj
         DLU2uk/bhPld6x+Of4gNplWa8qO5kXqh6yUFX5olvd64478+/MtUlxGibNZL7nl4pe8i
         MEA6IjA1EXEUTwjnY+MnAkZFy/TDXx1+Hbwyb5WQ+zMHqpBIiEmecmLTlmsrzfYdMOd4
         N8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GnEcVvfjc0afaecD6p4iJbtQNdfaHZzq5qCa8RK3128=;
        b=ynjBYZNYo8BQG2U/PQBTvlezVEb4hntUuU+celq+LYfGaEkLrgXmsK4VPfbvqaDHD7
         OWz8gVqp2Q/gu5fRPrOpkEwP7aVkDGZZh61kGwyCr/j/Ir+e//501xQJbVg4EGH4vPnG
         sdRynNFZlKECRzQIpzt7pVqbrToVft01LWfCmrOP4AjtDw4Fo3Sh84pMNQisIQz9Q1wd
         /ypVkKWJCn6IPPUwc4n/0smUe4f3qLekmrIx0GAUgS6xAkFGXaiE5cBMriBJnd/tY3rS
         vfU7jLjPO65nRNxspXk5YbYiXJxrU6RuWuJRhp4iSdV4mNXvj2WUiU4e60uO6zirp3WY
         OGLw==
X-Gm-Message-State: AOAM531gjKczKNfsuss8Ioht8M/j8wPFeudbyJE/2vNzgmcSfLADo2mm
        3DI76xzjMWRghNGbEEjqXb23WQ==
X-Google-Smtp-Source: ABdhPJxBSdxlMHh81mVbkn7ocV1JCNCVrLUYKh2+2dY6cdFay4NrJefErbjDxgvrCpcSaKDnIEmDMQ==
X-Received: by 2002:a17:907:9709:b0:6fd:c0e1:c86b with SMTP id jg9-20020a170907970900b006fdc0e1c86bmr3843634ejc.600.1654170904554;
        Thu, 02 Jun 2022 04:55:04 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o9-20020a170906600900b006fec8e5b8a9sm1666825ejj.152.2022.06.02.04.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 04:55:03 -0700 (PDT)
Message-ID: <9c747a07-c6bb-da02-67d7-7decbdcb0090@linaro.org>
Date:   Thu, 2 Jun 2022 13:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] dt-bindings: clock: Add indices for Exynos7885 TREX
 clocks
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     phone-devel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220601233743.56317-1-virag.david003@gmail.com>
 <20220601233743.56317-3-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601233743.56317-3-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/06/2022 01:37, David Virag wrote:
> TREX D Core and P core clocks seem to be related to the BTS (Bus Traffic
> Shaper) inside the Exynos7885 SoC, and are needed for the SoC to
> function correctly.
> 
> Add indices for these clocks.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
