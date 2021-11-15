Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5945450764
	for <lists+linux-clk@lfdr.de>; Mon, 15 Nov 2021 15:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235145AbhKOOrE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 15 Nov 2021 09:47:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbhKOOqy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Nov 2021 09:46:54 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B5DC06120D
        for <linux-clk@vger.kernel.org>; Mon, 15 Nov 2021 06:43:43 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id l19so16944253ilk.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Nov 2021 06:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JfI3JoXz0Ca1OgsWEHyo6RS3UZraM1AMQfqSQejQjIo=;
        b=EBIcyDEqfb8Y3brMg/s64Zs7YM6DOuNsOA0EX1xqAl6dxUcFFBBLbUpWS/d8vjHk+a
         z1svOa2SM8nlola2pw6iU6vEkk8oi16VJAZ2GZX6KodNhW5XkLYx9cAQRipwuVoG4HLI
         OPDlJkfElrYm1BJo0jadYYXreXomivz2vs0ZvICu+FrXYcQ8dRQoczdnS9/ozcdNQ14D
         e2ooYa2baQbWot0HL/bZh/MqYuZeYgjGRoECYsZDMwgDORUZC5zPNdyJztt2su9dZvMP
         dyb1zu427uumWkeW4COKrCQEtrwsvREwSnY0U48YQwC9d2M/I9CTvs1fg1QPdDBw5fcp
         31zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JfI3JoXz0Ca1OgsWEHyo6RS3UZraM1AMQfqSQejQjIo=;
        b=Z69FieaSYFmwy0QcOhsJc+to10YO7nTuObopRPhkruSnfGfU6A//bb+udpe9ZSHoSr
         qc1ES2MhTckMqq0WQH6v2NP9qOMIlC5zRYFB+9yf3iTxnJ2O0Vxr1iXqZKWgcO2mY66f
         8aIFxiXqgogM5lizrxA9MTRlt3skidj1WaQkGIWCgkN4tZNRLFaz/+c8nIyflavi5ZuC
         BVK7VFwHLlULIHoRzJOdOAWNR5CVwJ2fWwwyBwzciZLroBDLsQvybN7AjUttAsfL+Nwu
         2FppiWgDyyEcHRKmWu5MDDMrgoyQvTAYPiaRnU6y41mS3ui4pxPQ4GYPg6ZpwjKkxmmY
         bSRg==
X-Gm-Message-State: AOAM532ufDsR7dL+AlodcojBO0dZ5ycmNgxDWqDJC/RWDzhvo/2v7ZJ5
        h1c1SjENchfrZ7fVGdZKrnjwTw==
X-Google-Smtp-Source: ABdhPJz2yCZ0EINqTWjSs3tzPzMvPN86GdXRv8KNX4/5f+hxt1DRdnl/BVl1YvBWMPNlUjsZEE/hQw==
X-Received: by 2002:a05:6e02:178a:: with SMTP id y10mr21823246ilu.257.1636987422853;
        Mon, 15 Nov 2021 06:43:42 -0800 (PST)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id o10sm8997947ilc.56.2021.11.15.06.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 06:43:42 -0800 (PST)
Message-ID: <1411d7a3913677fee58e103f7610e122686e87bf.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/3] Add NVIDIA Tegra114 support to video decoder
 driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 15 Nov 2021 09:43:40 -0500
In-Reply-To: <20211114224732.11550-1-digetx@gmail.com>
References: <20211114224732.11550-1-digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dmitry,

Le lundi 15 novembre 2021 à 01:47 +0300, Dmitry Osipenko a écrit :
> Video decoder of Tegra114/124 SoCs uses additional memory buffer required
> for decoding of protected content. We won't support that content, but it
> is impossible to disable access to the buffer, hence a stub buffer needs
> to be provided. This series enables decoder driver only for Tegra114
> because Tegra124 support requires more non-trivial changes on both kernel
> and userspace sides.

I believe the stateless API is quite in place now, but I only see maintenance on
this staging driver. I don't believe it really make sense to keep maintaining a
staging driver without any step forward de-staging it. I believe it gives the
wrong message on the Kernel staging purpose.

I'm not criticizing your effort, I believe you are doing nice work for you
community, but would prefer to see this driver be ported to the official kernel
APIs rather then being maintain as staging till the end of time.

regards,
Nicolas

> 
> Changelog:
> 
> v2: - Changed tegra_vde_alloc_bo() to return errno and fix unassigned
>       error code in tegra_vde_probe().
> 
> Dmitry Osipenko (1):
>   media: staging: tegra-vde: Reorder misc device registration
> 
> Thierry Reding (2):
>   media: staging: tegra-vde: Support reference picture marking
>   media: staging: tegra-vde: Properly mark invalid entries
> 
>  drivers/staging/media/tegra-vde/vde.c | 147 +++++++++++++++++++++++---
>  drivers/staging/media/tegra-vde/vde.h |  18 ++++
>  2 files changed, 152 insertions(+), 13 deletions(-)
> 

