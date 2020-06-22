Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C304203DCB
	for <lists+linux-clk@lfdr.de>; Mon, 22 Jun 2020 19:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730007AbgFVRXG (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Jun 2020 13:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729983AbgFVRXF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Jun 2020 13:23:05 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0E2C061796
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2020 10:23:05 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id cm23so79531pjb.5
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2020 10:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BqM48ZdR4QdYBTv2c7+F0igShsRmPGqVwAJTalrh3Vo=;
        b=T/gZ4H2J+UpNQ96H4IQLTAW9jVMnZlvLzxm2OhJBDlYjOIQCD2FlzsoigqacLWJAhC
         FAIymS/2Mdmvf5jp+PMPTZPszQlLdMUtLLlxEwYzzRg8451YxoBJQ2B6yep7Gr3zpQtx
         oME5SyrfsBCu+p9qDBNWb5W0Ik4fADMMt3L3iqomKhLtenk4gH6tWYsAJe0N4bqlw6TY
         e4kzYPrOVngrkzYP4ZO7qK52KTWkEaDOe/Hc26SYciu91gstYIuQ457fS2tO+3Fhc++S
         J3tpbd0xhmS8RbKKoltaGvNLCIjSjHM0jjaUbZ0vQp8KhiEYCwyRbniMeg/jqRQHieMg
         4n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BqM48ZdR4QdYBTv2c7+F0igShsRmPGqVwAJTalrh3Vo=;
        b=mxZpel5pY65hECmE0W/FApcm0Vz2145ET0bfv/cYwn/1tju9aF6QV8Tevl9a1UqaUv
         DP7bgl1Q48AN+sX9EE6dpe/pO0+BfWsP7ecsfssgvbRma1tWvYB1AJ6XWFBntZMplXOU
         5hKSCLwK+8v2d4gHyVhtt2Mn/UuT6P2BSfe8OyY/tTIYvjcaLd3SwED6idHVl9VAuLiq
         IsoFJbOkpj1Z5x0R+oxC3EMWsswDEzvlb0O1FcK+neT1doMm0dYgVBYU7s9jJbsvRWyx
         czgYfwjJWArbm+qvkoowZmwKTTo+PapMmqGdF9XUzXPgaMhju8XKGCZ3W7xWXYF94bKW
         sHXg==
X-Gm-Message-State: AOAM530QL8vIGnZaLJ32VSn1f0WuCHK6tVmsgHG6Z1Ym4UtDBhh67XCG
        duFFVdaH2sqnQ10ZI36Bk1dyLsDwIKnyTyJchEDIog==
X-Google-Smtp-Source: ABdhPJzO+nq25CgrrJ901vreSYdCENCWSbB928SD41OoQSYC+oteTUNy5xrcCBXr3eXVXoqswpT2QCJu88gHklh2Xeo=
X-Received: by 2002:a17:90a:1e:: with SMTP id 30mr18013542pja.25.1592846584932;
 Mon, 22 Jun 2020 10:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200620033007.1444705-1-keescook@chromium.org> <20200620033007.1444705-11-keescook@chromium.org>
In-Reply-To: <20200620033007.1444705-11-keescook@chromium.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 22 Jun 2020 10:22:53 -0700
Message-ID: <CAKwvOd=N3HQNZfKMQ7eZWdawwNn13=YNNgMO0WAng2ERYX4Juw@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] KVM: PPC: Book3S PR: Remove uninitialized_var() usage
To:     Kees Cook <keescook@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
        b43-dev@lists.infradead.org,
        Network Development <netdev@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jun 19, 2020 at 8:30 PM Kees Cook <keescook@chromium.org> wrote:
>
> Using uninitialized_var() is dangerous as it papers over real bugs[1]
> (or can in the future), and suppresses unrelated compiler warnings (e.g.
> "unused variable"). If the compiler thinks it is uninitialized, either
> simply initialize the variable or make compiler changes. As a precursor
> to removing[2] this[3] macro[4], just remove this variable since it was
> actually unused:
>
> arch/powerpc/kvm/book3s_pr.c:1832:16: warning: unused variable 'vrsave' [-Wunused-variable]
>         unsigned long vrsave;
>                       ^
>
> [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
>
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Fixes: f05ed4d56e9c ("KVM: PPC: Split out code from book3s.c into book3s_pr.c")
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/powerpc/kvm/book3s_pr.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
> index ef54f917bdaf..ed12dfbf9bb5 100644
> --- a/arch/powerpc/kvm/book3s_pr.c
> +++ b/arch/powerpc/kvm/book3s_pr.c
> @@ -1828,9 +1828,6 @@ static int kvmppc_vcpu_run_pr(struct kvm_vcpu *vcpu)
>  {
>         struct kvm_run *run = vcpu->run;
>         int ret;
> -#ifdef CONFIG_ALTIVEC
> -       unsigned long uninitialized_var(vrsave);
> -#endif
>
>         /* Check if we can run the vcpu at all */
>         if (!vcpu->arch.sane) {
> --

-- 
Thanks,
~Nick Desaulniers
