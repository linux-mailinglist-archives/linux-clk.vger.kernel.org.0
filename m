Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0AE6D7492
	for <lists+linux-clk@lfdr.de>; Wed,  5 Apr 2023 08:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237014AbjDEGq5 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 5 Apr 2023 02:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236901AbjDEGq4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Apr 2023 02:46:56 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB02421A
        for <linux-clk@vger.kernel.org>; Tue,  4 Apr 2023 23:46:54 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id er13so97567608edb.9
        for <linux-clk@vger.kernel.org>; Tue, 04 Apr 2023 23:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680677213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aFIIRnrBNKokC228F+QRUypbBbxmHo1ru9OG9LqymOk=;
        b=bZw9ufpJnzBKuImrMGDvlIZcYpkuP7trTFI1zth/LoLk5RKEEHsKUn89UYPbQy8Zql
         cQpyE5JyNsaDMEkuJE+U2waLytyUnd/msaYyNbbClT/oQBgfd2ZlqDTTh9NuawqcWu/X
         QwWKCa2jZz5ICvPgguUoxvw0fyALbAOBDNJn3G0TY9S/005blsFtzTi84wRLOnnwza6B
         5mzxEo+962RX8+UZ+mJ6VdGQ4Rx1jL1VyaTkLc+hgwYFdFGNu220LHvXr3VhWA3uer5U
         +DWgrZh2vZlZS8KER1PbZXpfamjeJ3zg/ug2OB8leUM7ULl+fbJKISnEb17Is4QkwxBP
         gSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680677213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFIIRnrBNKokC228F+QRUypbBbxmHo1ru9OG9LqymOk=;
        b=WS8ROVr4txJldtdsGwKo8x9FrZuQITfhFZafS7vLwoZ/GXE20dEu30/JfLTacVHOYq
         dglApp1wcQdAZ3CdBlAOal+PC7xTdVb8Y8w+MS49RdTH1ON0mcKi4p7FutwkaLqDWiaI
         yUZb88RhYFBd03pNymic1W53S4X5Z00YyWfg7NZUyhlFqu9lCyX9aGNHmm6E2NUSgVur
         Dq3YF4nQulJGqitgw4uj9yPG/YSY/zI0TqzkBpCWuIjMM+ILNqhXR9Xcr/NDVqhaXbaQ
         iDjY7EJgGCfMiLZotmU/L2eSiZ8c9LLSoZhZc1S1vToucTyUNj8+EticWkX3x+x8lKnJ
         3ilQ==
X-Gm-Message-State: AAQBX9fskCMU0WOdZ+2k2hmIv+D6Zh7p7eoY/qAG9AAaJ7Alyvzm1yYX
        QpK43+tVc9rja7ivNYqxCieTlQ==
X-Google-Smtp-Source: AKy350aA1HLQgP9Fc8eNFl7f3RG7nlo1DaAaMg6OdwCzdNf2oo2Fy3A+7OlkjujnS9dUZa9CiI0hdw==
X-Received: by 2002:a17:906:8244:b0:93d:e141:e958 with SMTP id f4-20020a170906824400b0093de141e958mr1872119ejx.15.1680677213323;
        Tue, 04 Apr 2023 23:46:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3f:6b2:54cd:498e? ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id by20-20020a170906a2d400b0093120a11a5dsm6963824ejb.92.2023.04.04.23.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 23:46:52 -0700 (PDT)
Message-ID: <26194da1-95ad-ad04-ae14-319d3e309c1c@linaro.org>
Date:   Wed, 5 Apr 2023 08:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V2 3/9] dt-bindings: phy: qcom,qmp-pcie: Add ipq9574
 bindings
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
        bhelgaas@google.com, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, mani@kernel.org, p.zabel@pengutronix.de,
        linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_ipkumar@quicinc.com
References: <20230404164828.8031-1-quic_devipriy@quicinc.com>
 <20230404164828.8031-4-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230404164828.8031-4-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/04/2023 18:48, Devi Priya wrote:
> Add bindings for the PCIe QMP PHYs found on IPQ9574
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  Changes in V2:
> 	- Added the ipq9574 bindings here as the phy nodes in the DT
> 	  are modified to follow the latest style (without child node)
> 

The amount of changes and optionality of few properties suggests this
should be new binding.

Best regards,
Krzysztof

