Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B33F879E203
	for <lists+linux-clk@lfdr.de>; Wed, 13 Sep 2023 10:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238936AbjIMI0Z (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 13 Sep 2023 04:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238910AbjIMI0T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Sep 2023 04:26:19 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B352E1998
        for <linux-clk@vger.kernel.org>; Wed, 13 Sep 2023 01:26:14 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31f737b8b69so6082178f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Sep 2023 01:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694593573; x=1695198373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MoiLF9qWHetvzCqeRRmjqsm+XzU44/Y+Q1HjHiijaVk=;
        b=EdhhLngt5a0eQi59anhz1MT+BwGrYGcNs0gH+KUr58WJVAcf5FIwOtAn1lvEbgJGgO
         dl9/8PIxRHSvpwNBZNYLNCxC8K9NrqDEujmFbJefX2t8mrbu8SdObvMTPn+lfMH7WUCi
         JgKDWKK03xqGLCwN5bI0GOMKH2C/MqDSTUXHyU22Ogd3Cz7gAaY4BrLSscz2tLmDFp1L
         pg5h+R9vpw6FVStKsv8XqLfcNrxYlTYaxv+Qy52oCrev2xhWDnVV06kiBDrL4UhAwvZO
         Lf/RapebciMKoEJ8s00OEtVsUcTJ3VMN9f6D1HgCUXfCD6AByqPR27PoVc5/MoqNED3t
         d93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593573; x=1695198373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MoiLF9qWHetvzCqeRRmjqsm+XzU44/Y+Q1HjHiijaVk=;
        b=fmDce3iUrY3vFsLLrj893VdJb9V53BdFbPFMb8WXlks1G69XNL1hqBIABNYjCaQlC1
         bv5lj4xIgP0+Tq/zW+bv0ZxuXnCCtOd6/4m/5TXst+R3z/XmJOqFqgOFu4PBkKwLi6qw
         lpXc9bIhiAZ33s4khvYnTDTmZeDTdL+Mg8TlLOsmzNvIi4RtXiuSXxZyUlDWG8c5Q6AU
         tXIcKON/zsJww5UfjRGciHlOBhkuEE3BvCF2IILj8SxdxbNDc66OWxV4xOIjo8v1ZLTF
         69BYGdXTDIX2ViMyCHAd1OqRNfnGdplyVxUFzG7CLNnKw6637AoNFzXxp3RdzhwrmOMb
         epJQ==
X-Gm-Message-State: AOJu0YzsjkQOZkOiDBIZJ6qtqRXe5fgBiN6h3BP7TiKX1kjQcz0BzDjr
        dnQfSdsR5zEubgLGsKZw1uzW1w==
X-Google-Smtp-Source: AGHT+IFanqHvpz/OBQqvTsB3/lwBZqctCXSf2n5vpeLr5J1YVLJWmkIRLIDCy8G5mDDR4cSEzLpOzw==
X-Received: by 2002:adf:ea43:0:b0:317:5c36:913b with SMTP id j3-20020adfea43000000b003175c36913bmr1316763wrn.48.1694593573133;
        Wed, 13 Sep 2023 01:26:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id y18-20020adfd092000000b003179d5aee67sm14921713wrh.94.2023.09.13.01.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 01:26:12 -0700 (PDT)
Message-ID: <daed3270-847e-f4c6-17ad-4d1962ae7d49@linaro.org>
Date:   Wed, 13 Sep 2023 10:26:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH V2 6/7] arm64: dts: qcom: ipq9574: Add support for nsscc
 node
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Devi Priya <quic_devipriy@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, arnd@arndb.de, geert+renesas@glider.be,
        nfraprado@collabora.com, rafal@milecki.pl, peng.fan@nxp.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
        quic_saahtoma@quicinc.com
References: <20230825091234.32713-1-quic_devipriy@quicinc.com>
 <20230825091234.32713-7-quic_devipriy@quicinc.com>
 <CAA8EJpo75zWLXuF-HC-Xz+6mvu_S1ET-9gzW=mOq+FjKspDwhw@mail.gmail.com>
 <CAMuHMdXx_b-uubonRH5=Tcxo+ddxg2wXvRNQNjhMrfvSFh0Xcw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdXx_b-uubonRH5=Tcxo+ddxg2wXvRNQNjhMrfvSFh0Xcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/09/2023 10:23, Geert Uytterhoeven wrote:
>>
>>> +                       clock-names = "nssnoc_nsscc", "nssnoc_snoc", "nssnoc_snoc_1",
>>> +                                     "bias_pll_cc_clk", "bias_pll_nss_noc_clk",
>>> +                                     "bias_pll_ubi_nc_clk", "gpll0_out_aux", "uniphy0_nss_rx_clk",
>>> +                                     "uniphy0_nss_tx_clk", "uniphy1_nss_rx_clk",
>>> +                                     "uniphy1_nss_tx_clk", "uniphy2_nss_rx_clk",
>>> +                                     "uniphy2_nss_tx_clk", "xo_board_clk";
>>
>> You are using clock indices. Please drop clock-names.
> 
> What do you mean by "using clock indices"?
> Note that the "clock-names" property is required according to the DT bindings.

Indeed, thanks for pointing this out. Probably bindings should be changed.

Best regards,
Krzysztof

