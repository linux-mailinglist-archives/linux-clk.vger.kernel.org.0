Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 345D359A7C7
	for <lists+linux-clk@lfdr.de>; Fri, 19 Aug 2022 23:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbiHSVez (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 19 Aug 2022 17:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiHSVey (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 17:34:54 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 614D510E970
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 14:34:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id D14B9CE2784
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 21:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB89C433D6;
        Fri, 19 Aug 2022 21:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660944890;
        bh=jEifeMvcVcmUL3AvDcd/wNV8VBXPnemd0/AWGv67n00=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=ORnzM8sF19lyi/0MSqydQmLSlFx8hg/Cdo9Ej4pxdMl4P0eo3Vh6GS61ukCQU1nrJ
         Kk365lv4r9SOHUSKDwMQEA4Ea49BvPu0ch5LMTXXyebXSzqJw5Bi2CcnP43gH3F0Sh
         oudSYDgLT4qFFDNQ3Mv3DR2+6w5nBNh3HUnAEEKU3F5bMMXYQUI3ftLmknFJGT9JBd
         zLZKUuTguEqK3L7xIMJTqDKXiKEhgWMMua8ziHn6VsItadDofFCUKzwdqFc8ajM4dz
         TE0cTXNO/PdCm/R8Sj+EnvSpmIrLHsjZHVHHBJJzcHAnz9ULGu7pKk06EwspP1rfwW
         xDYwWmrJjVDFg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220628142416.169808-1-windhl@126.com>
References: <20220628142416.169808-1-windhl@126.com>
Subject: Re: [PATCH v2] clk: st: Hold reference returned by of_get_parent()
From:   Stephen Boyd <sboyd@kernel.org>
To:     linux-clk@vger.kernel.org, mturquette@baylibre.com, windhl@126.com
Date:   Fri, 19 Aug 2022 14:34:48 -0700
User-Agent: alot/0.10
Message-Id: <20220819213450.1DB89C433D6@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liang He (2022-06-28 07:24:15)
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_put() for refcount balance.
>=20
> Fixes: 3efe64ef5186 ("clk: st: clkgen-fsyn: search reg within node or par=
ent")
> Fixes: 810251b0d36a ("clk: st: clkgen-mux: search reg within node or pare=
nt")
>=20
> Signed-off-by: Liang He <windhl@126.com>
> ---

Applied to clk-next
