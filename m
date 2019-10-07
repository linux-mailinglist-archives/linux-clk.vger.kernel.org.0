Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA235CE0CD
	for <lists+linux-clk@lfdr.de>; Mon,  7 Oct 2019 13:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727612AbfJGLtS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 7 Oct 2019 07:49:18 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33042 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfJGLtS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Oct 2019 07:49:18 -0400
Received: by mail-lj1-f194.google.com with SMTP id a22so13310156ljd.0
        for <linux-clk@vger.kernel.org>; Mon, 07 Oct 2019 04:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vn65rxyxkcDKM7eRq/iwZytkFp0EAVNWePIOi3CZefY=;
        b=CMynOunbxDxv3PBp2Vcw0gR5OkokufNzPSFo+ra1Z6Pf3bQu6fcO3OBZ55edaZuLKe
         Y3UhT71phgluo/ogwRGzNmusbiyk5d0K4YX2Zq8Roc1YSvb37F7ICXFhofkuxRA2nALG
         Km7ziO2Ko0djTwQF4v6gyAZNHqTy0CO7Log1N/p545Xrk1196h1ioAErvLNfraJrJD3n
         eXQy8AHIGBDYdorrkVfMI2bU9VjM4R4lRWiLBpdfx8kecGpha4mKUiWcTzmuuSFM/8p/
         o+VNo/fOD+XuXUmKOlwYDgNtXuRJAJDDjpKiG+AFsIBwCIUA9FimIMtRXQPgI2VdQnrt
         7hfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vn65rxyxkcDKM7eRq/iwZytkFp0EAVNWePIOi3CZefY=;
        b=d9hWC4xyvjyVkSXn+lt7EzYt0z0uspJpFJbyDQj2IPvqa+3b5tfkoWZGPFXT3KHUeR
         k49bJZohd7PtpPAHNUm+D9TCCy5y5S9LW6fWnr80I/MxAW+JXaHI61LEd4xDLlicZmvy
         Qmrf3ojEtvMchk4k3LoIuKA+oOKToQNE8ALUz5Fx3ZcuHRUMgmSdt4Wn1pRfwlXTtvks
         HnUrb6Iz/tgE2gQBMnwygTt3zotI3TYHudu5GmJ83JuH6QDgAEoJoA9w0viUjRARt+9H
         +NZVfI0Atvl4SsuIgpYiQVeXConOfmNC+0Ps8nrGZQ+uRAiWz0eKRlwPpo+/TM4LQfeS
         v7+g==
X-Gm-Message-State: APjAAAUwUUQtZC5wdLHKvOOuGpwzqNSibARrBZUr42Pnm3WgFzY2CJ66
        SsAmqzxS89S+9ublnVi5DeQ+Xc99RbMd+g==
X-Google-Smtp-Source: APXvYqwpFzWYTYAdokA75Opti7sBSd7uL4ymj8fq09wr3G03tu1Bwn0L8NcgU3C7RW7uBUepkPnVYg==
X-Received: by 2002:a2e:9450:: with SMTP id o16mr17814788ljh.178.1570448955980;
        Mon, 07 Oct 2019 04:49:15 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:46e0:3acf:f082:3ccc:4789:6235])
        by smtp.gmail.com with ESMTPSA id j28sm2678151lfh.57.2019.10.07.04.49.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 04:49:15 -0700 (PDT)
Subject: Re: [PATCH] clk: renesas: rcar-gen3: allow changing the RPC[D2]
 clocks
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
 <be27a344-d8bf-9e0c-8950-2d1b48498496@cogentembedded.com>
 <CAMuHMdVmh6fZ=oRRMA6+H05jdpyPPgK3g=1ivNQUe0LB5sfMjg@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <c879023c-77d9-5230-7086-4a495999f154@cogentembedded.com>
Date:   Mon, 7 Oct 2019 14:49:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVmh6fZ=oRRMA6+H05jdpyPPgK3g=1ivNQUe0LB5sfMjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/07/2019 02:45 PM, Geert Uytterhoeven wrote:

>> I was unable to get clk_set_rate() setting a lower RPC-IF clock frequency
>> and that issue boiled down to me not passing CLK_SET_RATE_PARENT flag to
>> clk_register_composite() when registering the RPC[D2] clocks...
>>
>> Fixes: db4a0073cc82 ("clk: renesas: rcar-gen3: Add RPC clocks")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks for your patch!
> 
> LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

   Thanks. :-)

> Now, before I apply this: does this make RPC-IF work?

   Unfortunately, no. :-/

MBR, Sergei
