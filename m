Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC85F6D9EE1
	for <lists+linux-clk@lfdr.de>; Thu,  6 Apr 2023 19:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239476AbjDFRfJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 6 Apr 2023 13:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239497AbjDFRez (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Apr 2023 13:34:55 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131CAA276
        for <linux-clk@vger.kernel.org>; Thu,  6 Apr 2023 10:34:27 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id sg7so3197020ejc.9
        for <linux-clk@vger.kernel.org>; Thu, 06 Apr 2023 10:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680802464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8o3EoZ1JRk710zUyDpdKYa+magSoQJ+Man8QMgiHo6Q=;
        b=CTi/ZXhL3hOFciRN9KFDq+NfuU4tBzhjNWf1azXXymquM8nG1Sasbb16e5cuVzFi0H
         xzETDrvvAFIZlA/7B9UXS9u+BMBdAQOjXzdSdT2Ta1vnliqVSrOXQLdnOzytDVYS0Q0c
         YC7p5f25tQHaE2y6VegCYklQ+ufUwQqX+OsBzUVENuX7z/xPFzN18jZHLFtON6x8AD0E
         o1CFZv7yDX63QjykmoemK+d+LSiMMeC3rM9JBCrVLVtstlYvetA+yWPVe2ri8ov7RsB0
         cRY6UterViYwxThApTz2bwwZno7RHwHVbhgPQG7nhgv5ijnBf1uUpQ0qGp+7m9tOHAwF
         Zo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680802464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8o3EoZ1JRk710zUyDpdKYa+magSoQJ+Man8QMgiHo6Q=;
        b=vVOrQ1CAKAk6ZGEdywwsEPHrO7DnMEVZ3SObIzBReJsV28pqIPJ9GFkBHETKLGWgDF
         0YeQDgWuFv85cBmHkYIxMIQqsBCwbb05juANsvEimSVydROz1hotV80V5jCVrwo2+t5S
         9xDYtlWHQWeHft7ausHRtm1FwZhT/7VfQZf2ZaDgc3I1Z9SbHjrRz+D4FSAQbmFiwl47
         ZatRVj27IINHKEOiunJWzqSNqxT+ffjbcYWeXGr/6CnmK0VDLr0FKWXM7UhlUjalCzti
         bV3iXWxY+og2ztcbZC0j9RcM3ICyYzJIrBhbZZ3medKNCcAfS7Qfej55imGlpIWl2+LT
         urNA==
X-Gm-Message-State: AAQBX9eIMyCav5Ybghxn8axL3odpi0XZIDS+D2ZO52szGqm9s80h3hDZ
        oCYXi58eVg+9Mj4neHTWZJa2Zg==
X-Google-Smtp-Source: AKy350Zbh0P1Aw932RSOPLQD+3BjO5PlqOGIucWLDsJF9mruynrNaAF87yNNnH1iwPMfg7zfaPiMog==
X-Received: by 2002:a17:906:8a75:b0:931:6921:bdb7 with SMTP id hy21-20020a1709068a7500b009316921bdb7mr6690097ejc.60.1680802463784;
        Thu, 06 Apr 2023 10:34:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709060e8100b0092421bf4927sm1072728ejf.95.2023.04.06.10.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 10:34:23 -0700 (PDT)
Message-ID: <0a09e2f4-b3aa-7f23-48b1-743e8f561635@linaro.org>
Date:   Thu, 6 Apr 2023 19:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/5] Add support for Blaize BLZP1600 SoC
Content-Language: en-US
To:     Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     "soc@kernel.org" <soc@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "olof@lixom.net" <olof@lixom.net>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "sboyd@kernel.org" <sboyd@kernel.org>
References: <20230406102149.729726-1-nikolaos.pasaloukos@blaize.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406102149.729726-1-nikolaos.pasaloukos@blaize.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/04/2023 12:22, Niko Pasaloukos wrote:
> Adds basic support for the Blaize BLZP1600 SoC.
> This SoC contains two cores of Cortex-A53 CPUs, one Blaize
> Graph Streaming Processor (GSP) and several other IPs.
> 
> Nikolaos Pasaloukos (5):
>   dt-bindings: Add Blaize vendor prefix
>   dt-bindings: arm: blaize: Add Blaize BLZP1600 SoC
>   dt-bindings: reset: Add binding constants for BLZP1600
>   dt-bindings: clock: Add binding constants for BLZP1600
>   arm64: Add initial support for Blaize BLZP1600 CB2

You miss maintainers entry. Cc soc@kernel when your submission is ready,
because now it is too early.

Best regards,
Krzysztof

