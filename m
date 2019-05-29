Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74C592DE88
	for <lists+linux-clk@lfdr.de>; Wed, 29 May 2019 15:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfE2Ni2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 May 2019 09:38:28 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39277 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbfE2Ni1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 May 2019 09:38:27 -0400
Received: by mail-lj1-f196.google.com with SMTP id a10so2489164ljf.6;
        Wed, 29 May 2019 06:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:newsgroups:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VoMv/71us6M8DbDViUqysPdNgAN+xa2mLNMMXYgg6YA=;
        b=fpu2tXpr7clU9LTk7+KSRqjY63WODxNTsAcGqDq5xKZ2wIbupZFJILlIdQZ4TftjNl
         TmyGmp5IsKkvk/qitY+t+oMibDc5WR0hiyTI+QvmrGMbRNx2pF9znsL5Vvv/gYvumKCh
         MZWzLFgHPnVRAHZhovrKRLH+jRci9pJcfWKEgQCiwG52567NA9TLoIWiSJx6JMkEEKxK
         bl79yTvtQ/vUU4hjm5yRhaUzCKgyjOLkxjSOTeV60mZoiXxmALxK7Ba7up3bXO0P8+YE
         wf5A5SjHT5oPaD+dYfu3sgdFjuN2p3uwiQvPMDgsoIfbKbMJcvWY0Vv/WQqIoUzXM/n5
         8niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:newsgroups:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VoMv/71us6M8DbDViUqysPdNgAN+xa2mLNMMXYgg6YA=;
        b=gLkv66moLIGucKuW/H4f9lqmIHrpcYuMNPMYznI/2BDY/yq3WXkd1rZBduyMGuJFVF
         eh3aN8qH+tebEYcMGZLegM0VXI92syxESd2fu0vEMcuGi4Y3JFynQ6uWusomeXKBTL+w
         6+KCgI2j3QoFmT69CEFfJH2Qt6jTC1XNFAJCXv7TKp7lhBvjJ4uWyVJwO+5Pa4/1Hk8w
         FP0phq9fCVWMMficVcbZm8RcyOheitOrcuWdFmFoGZSqUpcHwvSK7oJlURkuKglnMt1X
         7VQ1DC4tM8kO7JLMD0Sc6pCqTLoiv/UtDGS/ZMa0RlGG/ePfS1dp9vTnJBsMUhZrh0Ov
         NUsQ==
X-Gm-Message-State: APjAAAXcpYrGDO9MkD8Nq8PF+N/NxFB+8Sq804px3SDM8sUTQmPCLJAL
        RidCTADJOjAjWVaYyZG4xcxYRqie
X-Google-Smtp-Source: APXvYqzERz4U+Q9lLxvdncfDaBvdigW9kVACUuZgbRyZIBY4T9hQ8Em3/wCwkzyuRxGYSusJMHudyw==
X-Received: by 2002:a2e:9a9a:: with SMTP id p26mr3978876lji.64.1559137104811;
        Wed, 29 May 2019 06:38:24 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id d5sm3525117lji.85.2019.05.29.06.38.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 06:38:24 -0700 (PDT)
Subject: Re: [PATCH V4 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Newsgroups: gmane.linux.ports.arm.kernel,gmane.linux.ports.tegra,gmane.linux.drivers.devicetree,gmane.linux.kernel.clk
References: <20190529082139.5581-1-josephl@nvidia.com>
 <20190529082139.5581-6-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5bd95d0b-e1a5-e717-4d5a-b9ef5d5fa4a5@gmail.com>
Date:   Wed, 29 May 2019 16:37:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529082139.5581-6-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

29.05.2019 11:21, Joseph Lo пишет:
> This patch adds the required APIs and variables for the EMC scaling
> sequence code on Tegra210.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> v4:
> - fix the API with generic naming
> - use 'u16' in 'struct emc_table_register_offset'
> ---

[snip]

> +void emc_writel(struct tegra_emc *emc, u32 val, unsigned long offset)
> +{
> +	writel_relaxed(val, emc->emc_base[REG_EMC] + offset);
> +}
> +
>  u32 emc_readl(struct tegra_emc *emc, unsigned long offset)
>  {
>  	return readl_relaxed(emc->emc_base[REG_EMC] + offset);
>  }
>  
> +u32 emc1_readl(struct tegra_emc *emc, unsigned long offset)
> +{
> +	return readl_relaxed(emc->emc_base[REG_EMC1] + offset);
> +}

Please make all the global one-line functions static and inlined, then
move them out into the header. This will allow compiler to optimize code
better and also will hide these generic-looking global symbol names from
unrelated parties in the multiplatform kernel build.

-- 
Dmitry
