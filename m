Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36F13BA201
	for <lists+linux-clk@lfdr.de>; Fri,  2 Jul 2021 16:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232938AbhGBOOz (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 2 Jul 2021 10:14:55 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:59635 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232918AbhGBOOz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jul 2021 10:14:55 -0400
Received: from [151.57.67.62] (port=43385 helo=[192.168.1.114])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lzJu1-0007eY-Ld; Fri, 02 Jul 2021 16:12:22 +0200
Subject: Re: [PATCH v4 2/3] clk: vc5: Use dev_err_probe
To:     Sean Anderson <sean.anderson@seco.com>, linux-clk@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>
References: <20210701182012.3421679-1-sean.anderson@seco.com>
 <20210701182012.3421679-2-sean.anderson@seco.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <abfa0e1a-9f06-a953-acd2-5d3e77d03b96@lucaceresoli.net>
Date:   Fri, 2 Jul 2021 16:12:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701182012.3421679-2-sean.anderson@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sean,

On 01/07/21 20:20, Sean Anderson wrote:
> Convert uses of dev_err + return to dev_err_probe.

The patch is also converting uses of dev_err() without return.

Not a big deal anyway. With or without this fixed:

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

Note: this patch can be applied independently from the other two.

-- 
Luca
