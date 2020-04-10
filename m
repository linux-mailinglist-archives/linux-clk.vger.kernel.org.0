Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB3D1A4765
	for <lists+linux-clk@lfdr.de>; Fri, 10 Apr 2020 16:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgDJO20 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 10 Apr 2020 10:28:26 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34086 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgDJO20 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Apr 2020 10:28:26 -0400
Received: by mail-lf1-f66.google.com with SMTP id x23so1502440lfq.1;
        Fri, 10 Apr 2020 07:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=114DepywJbkKU/kNK8ifxFxs4xFQzPNOTcqxhW01gig=;
        b=vb+IEAC9JkmoBHpGwKsz0ASSJblQcwkss5tbEZrtPTg9+AUTqKOuJ45fe1+AnyMYL5
         Tc0TT8YjluJfHOZk6aHSWSIt6J2lwEFAzns+Z26BNdGZo50LlLEy+nte46mBQYq9XlR4
         Erh2NVUxmWuLIlA0WGNEuKx4P7G1fWFKNUAwxZHaaqMddS9wt29OKkwNuBQlqLab9W2K
         AJzFosMzctfnHY0/kJpgNgKU8VniE0FScHP4SPYJX9l8R5a5qBdjtJrHaPNY7u9Q6f1O
         4PiwFumFlLTF/S43L+8hGL2dmZqHy00kHSed3woKNhL12tlGBRDCEaTqqhwyWkeIOkl+
         n36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=114DepywJbkKU/kNK8ifxFxs4xFQzPNOTcqxhW01gig=;
        b=NuMLRHDq1W6Mtnw2xmDRjiXgAjSHcMsshwOweCkpkKpd0joYSSDr9R3aOUkFU9ARGI
         KMYgtJEjSKZQWFJk3EjpVczWkqrND3V0ddkUflPlrCXwJXxsQye+5Fj71cWtda8jTixn
         tDc5GtSdo9fBYYI9AQWsCgJJr7sedlNF7Ykd0DjGRfmvZ8C8EqPhWa0+mV6zNjLCqSXv
         W2jadipmFfOqZ8L7qdfrkpLyEWKn48AxNjrfGlyI/lsBVLM1EWIdZK4hkuogedCLOJBR
         bwQ71/e1tYp3AWNUReK8D/m8eBRn3J/ygW/y8AUodJPAZ6fx1SiJOd65rckOQ/qJrfEo
         OJUg==
X-Gm-Message-State: AGi0Pub01PNR/pR91ybA07wLhDUCu3wsS+0f7G4BvNi8JuODUPtVpCTr
        kGlQRTCw+TU1hsqKZtuo0cs=
X-Google-Smtp-Source: APiQypK+DeCHy8Q90LIm8WJtFHRQdsbxGiBMPZhDXTTciugISnAqkYYnxNBFX0eNC3l+386WkJSWwA==
X-Received: by 2002:a19:d84:: with SMTP id 126mr2840495lfn.35.1586528904234;
        Fri, 10 Apr 2020 07:28:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id k4sm1351793lfo.47.2020.04.10.07.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 07:28:23 -0700 (PDT)
Subject: Re: [PATCH v6 11/14] memory: tegra: Support derated timings on
 Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-12-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <937a1aa6-473a-f6c5-729a-4f34e4ee3abb@gmail.com>
Date:   Fri, 10 Apr 2020 17:28:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200409175238.3586487-12-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
> -enum tegra210_emc_dram_over_temp_state {
> -	TEGRA210_EMC_DRAM_OVER_TEMP_NONE = 0,
> -	TEGRA210_EMC_DRAM_OVER_TEMP_REFRESH_X2,
> -	TEGRA210_EMC_DRAM_OVER_TEMP_REFRESH_X4,
> -	TEGRA210_EMC_DRAM_OVER_TEMP_THROTTLE, /* 4x Refresh + derating. */
> +enum tegra210_emc_refresh {
> +	TEGRA210_EMC_REFRESH_NOMINAL = 0,
> +	TEGRA210_EMC_REFRESH_2X,
> +	TEGRA210_EMC_REFRESH_4X,
> +	TEGRA210_EMC_REFRESH_THROTTLE, /* 4x Refresh + derating. */
>  };

What about to avoid all the unnecessary renamings?
