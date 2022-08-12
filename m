Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 250CB590E86
	for <lists+linux-clk@lfdr.de>; Fri, 12 Aug 2022 11:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238155AbiHLJzz (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 12 Aug 2022 05:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237512AbiHLJzY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Aug 2022 05:55:24 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F95C11A2D
        for <linux-clk@vger.kernel.org>; Fri, 12 Aug 2022 02:55:22 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id r17so634229lfm.11
        for <linux-clk@vger.kernel.org>; Fri, 12 Aug 2022 02:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=T5iIzTCDVHqt30FHfCBf7QyCkBoOs7GPL9+XgJpnyHY=;
        b=wzhT+buoDcE5KBLNi6WAqq2oLZi0r2AKjAMCS+H+73hksv87Nlik8u7vCpU7xCGkTK
         dbcrW/+mteB6uMRvRmsI/DfdobEjH2Wnom7i3hOCWUTPkbQCBZ01C2nVnEWWndW0NNX8
         Vy6PYOdE9cf5pXDtLm/MlNkuiIWbd0qZoFH95l7i8aeyMi+DqpKI7NWazSRwg/JaR+nT
         We4m8IRm5bg4qOtwNGwEJFJHVoCaxIxqbxEL6jhbnsDmXV59L6FIK8eCm79/6gaSy/gl
         +/amH1RU58cCY2dclZUCOu9cHem5YidgDAH7eR9xifYlXAWe2F1zdLwHZYXBJWMCNc4o
         OxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=T5iIzTCDVHqt30FHfCBf7QyCkBoOs7GPL9+XgJpnyHY=;
        b=S02zzs1FpgrRd0/q0gAzKLWBlH2bSgTd2lECYXXaRJuV//z1nirSRJevxhBFrJ97VH
         mZ7atgz8qbxRig2NVMtOt94yLF6r9K8lQSB0U+jXyncF002fMyiIYheSjbreOU3XnxJK
         kzSMgxZ5ytDpnkVSXRIMjkbe9Whq+Bi7MRzRKadsxK5aoet70iBWjG4HUkMyINuanaD1
         g2lmvqg9sZkl/tGtuSO7BFIbqfrlv4rHOlYxVp4/Kf1zvLh2wCNIqugvDfv349y6VaFF
         YiV35SKMEtMncf1ZqyrZYBPLl8j/NBFzPFUDJ1+fOUecz/hCWexgtDC+Ry46mC7/iTn+
         4Pqg==
X-Gm-Message-State: ACgBeo0UwWKB6CEdizGPjPh6xuqJCtX+f7w9rOYGbbFhku+34Iz9WD3f
        CpSy+Zoeq2XU0CRp7C375cAKIQ==
X-Google-Smtp-Source: AA6agR7+AJPeAcWzIKKPAUQqUNDiGibnaRRiY1ldxGkU5iEvz7Z8KODNoh3VQbhU39rSPYcKl7QjEg==
X-Received: by 2002:a05:6512:1585:b0:48d:158:7013 with SMTP id bp5-20020a056512158500b0048d01587013mr1116184lfb.536.1660298120968;
        Fri, 12 Aug 2022 02:55:20 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id s12-20020a05651c048c00b0025e4ed638dcsm301594ljc.59.2022.08.12.02.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 02:55:20 -0700 (PDT)
Message-ID: <af463efe-1656-5638-b41a-5daea3099812@linaro.org>
Date:   Fri, 12 Aug 2022 12:55:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 7/9] clk: samsung: exynos850: Implement CMU_MFCMSCL
 domain
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220809113323.29965-1-semen.protsenko@linaro.org>
 <20220809113323.29965-8-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220809113323.29965-8-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/08/2022 14:33, Sam Protsenko wrote:
> CMU_MFCMSCL clock domain provides clocks for MFC (Multi-Format Codec),
> JPEG Codec and Scaler IP-cores. According to Exynos850 TRM, CMU_MFCMSCL
> generates MFC, M2M, MCSC and JPEG clocks for BLK_MFCMSCL.
> 
> This patch adds next clocks:
>   - bus clocks in CMU_TOP for CMU_MFCMSCL
>   - all internal CMU_MFCMSCL clocks
>   - leaf clocks for MFCMSCL, TZPC (TrustZone Protection Controller),
>     JPEG codec, M2M (Memory-to-Memory), MCSC (Multi-Channel Scaler),
>     MFC (Multi-Format Codec), PPMU (Platform Performance Monitoring
>     Unit), SysMMU and SysReg
> 
> MFCMSCL related gate clocks in CMU_TOP were marked as CLK_IS_CRITICAL,
> because:
>   1. All of those have to be enabled in order to read
>      /sys/kernel/debug/clk/clk_summary file
>   2. When some user driver (e.g. exynos-sysmmu) disables some derived
>      leaf clock, it can lead to CMU_TOP clocks disable, which then makes
>      the system hang. To prevent that, the CLK_IS_CRITICAL flag is used,
>      as CLK_IGNORE_UNUSED is not enough.

No, same as with ISP these are not critical clocks.

Best regards,
Krzysztof
