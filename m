Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99F8362FBF8
	for <lists+linux-clk@lfdr.de>; Fri, 18 Nov 2022 18:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235396AbiKRRsZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 18 Nov 2022 12:48:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242417AbiKRRsV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Nov 2022 12:48:21 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54375EF89
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 09:48:20 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id d6so9356206lfs.10
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 09:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLuxvrtTwLpjQCdZkBOlAPtT4PuOt7o3XUb4SWGRYeY=;
        b=Xp5hsF3ZcA4JNkrWePSAeHwOrOVi9oPmNBagmr0NNG9vrT2qIy03d9XIdkxfSs7Ycs
         L5mBHjI42fbW99+DwGAR3KDPJhdSabjF/dkYmSPPR18Lx/A8Y/tuY4ODsDBb2Khjv/i1
         jmacQX8zziLazzRGVKlwFY1c1gzpB8q5vvHGbEBOWP8sQCp3qDZhSr1+UPg73QhW53UT
         nXh02/SH4RDSWzumVmk466rcibQkzqImJVAhsQ01KyzAUMd1fVCFLrxTbZmL70RQSTPF
         hoXwA9ipEEfcaJ1f3oi4rnnyLWRwjRQ8VUySG5mUxGoX5LqkPdj+YdhSrIH8KymvXDnf
         F7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLuxvrtTwLpjQCdZkBOlAPtT4PuOt7o3XUb4SWGRYeY=;
        b=Epo3wUNkMLNsqeW8Z1z/UPsjg0oC8lJX2hWk94CUi5v/kb2YmNDRYA2A1KvlN8+oqk
         f842yw3aQXw59K9FiJu9b03dX6IuNVkfMKUhH9JJQ5bwnNf+dmgSETq1nOW9xYiuQkb9
         UnDq378+E/HhmVZzaG+LPQAYiAwxWmcvZIXiI+tpvy1bBDNQd+Fj68g4UQYZBmKuAFNp
         f+xBAHsR7i1VLdi0M6b8ZSu08TTdegAfvxtO0QxFSPzUgcX7VmI9TqhMwz2jddGq9FXo
         zBG8anRNTaeUkTSr2+gvwg3sgBTJco99Hv/0zTFxBI5zig2/1Uq1Kit6umLiuOJJiSl6
         ncUQ==
X-Gm-Message-State: ANoB5pn08Pz08BOTrmEptfQl4X44QQ6RL+2v7fBPYL4mPUBk/s7wkEJl
        Occ5AEhBJy+xaYQAHFrvzwAqaUB+QpBxl9Tp1HQ=
X-Google-Smtp-Source: AA0mqf7NEOl5fCq9S+v16birSZketomBxGgaIuFTxUFuJUgR/0PF94RL78dd4tRSt4jSn1AFfE/dsKbdW4oyraCCzIs=
X-Received: by 2002:a05:6512:250f:b0:4b4:abb4:c34d with SMTP id
 be15-20020a056512250f00b004b4abb4c34dmr3248994lfb.218.1668793699034; Fri, 18
 Nov 2022 09:48:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:651c:4cc:0:0:0:0 with HTTP; Fri, 18 Nov 2022 09:48:18
 -0800 (PST)
Reply-To: thajxoa@gmail.com
From:   Thaj Xoa <arounayawo@gmail.com>
Date:   Fri, 18 Nov 2022 17:48:18 +0000
Message-ID: <CALU0pJeD98fk4MpGC26Lb-S0PdMpV=+woqSWEgVz_jxBvfbXCA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

-- 
Dear Friend,

I have an important message for you.

Sincerely,

Mr thaj xoa
Deputy Financial State Securities Commission (SSC)
Hanoi-Vietnam
